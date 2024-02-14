// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riilfit/src/data/Models/gym.plans.models.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GymPlanController extends BaseController {
  void navigateToLoginScreen() {
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  void onInit() {
    enableButton();
    fetchGymPlans();
    super.onInit();
  }

  Rx<TimeOfDay> openingTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> closingTime = TimeOfDay.now().obs;
  RxString selectedPlanType = 'GOLD'.obs;
  var isLoading = false.obs;
  var thisGymPlans = <gymPlans>[].obs;
  var isGymPlanLoading = false.obs;
  var deleted = false.obs;

  final isButtonDisabled = true.obs;
  void navigateToEditpPlanScreen() {
    Get.offAndToNamed<void>(
      Routes.editGymPlans,
    );
  }

  void updateOpeningTime(TimeOfDay newTime) {
    openingTime.value = newTime;
  }

  void updateClosingTime(TimeOfDay newTime) {
    closingTime.value = newTime;
  }

  final planPriceController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planDescriptionController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  var planTypeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planOpenTimeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planCloseTimeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planFeaturesController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planAccessDaysController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  void enableButton() {
    isButtonDisabled.value = planPriceController.text.isEmpty ||
        planDescriptionController.text.isEmpty ||
        planOpenTimeController.text.isEmpty ||
        planCloseTimeController.text.isEmpty ||
        planFeaturesController.text.isEmpty ||
        planAccessDaysController.text.isEmpty;

    return;
  }

  Future<void> createPlan() async {
    final createPlanBody = <String, dynamic>{
      'paymentRecurrence': 'MONTHLY',
      'amount': planPriceController.text as dynamic,
      'category': planTypeController.text.toUpperCase(),
      'description': planDescriptionController.text,
      'type': 'TOP',
      'features': {
        'visitsPerMonth': planAccessDaysController.text,
        'accessPeriod': {
          'start': planOpenTimeController.text,
          'end': planCloseTimeController.text,
        },
        'privileges': [
          '',
          '',
        ],
      },
    };

    // Retrieve the token from Hive
    final box = await Hive.openBox('gymOwnerData');
    final token = box.get('token', defaultValue: '');
    print(token);
    isLoading.value = true;
    var response = await http.post(
      Uri.parse('https://riilfit-api.vercel.app/gyms/manage/plans'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(createPlanBody),
    );

    final jsonResponse = jsonDecode(response.body);

    await Future.delayed(Duration(seconds: 3));
    final message = jsonResponse['message'];
    print(message);
    if (jsonResponse['message'] != null) {
      Get.back();
      print('something here');
      Get.snackbar('', '$message');
    } else if (jsonResponse['statusCosde'] == 400) {
      Get.snackbar('Error', 'some details have not been specified');
      isLoading.value = false;
    }
    // } catch (e) {
    //   Get.snackbar('', '$e');
    // }
    isLoading.value = false;
  }

  Future<void> fetchGymPlans() async {
    isGymPlanLoading(true);

    await Future.delayed(Duration(seconds: 5));
    try {
      print('getting plans');

      final box = await Hive.openBox('gymOwnerData');
      final token = box.get('token', defaultValue: '');
      print(token);
      final response = await http.get(
        Uri.parse('https://riilfit-api.vercel.app/gyms/manage/plans'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      isGymPlanLoading(false);
      // print(response.body);
      // isLoading.value = false;
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        final data = jsonResponse['data']['items'];
        thisGymPlans.clear();
        print(data);

        // print(data);

        for (final item in data as List<dynamic>) {
          // print("3333");
          // print(data);
          final id = item['_id'] as String;
          final visitsPerMonth = item['features']['visitsPerMonth'];
          final description = item['description'] as String;
          final category = item['category'] as String;
          final amount = item['amount'];
          final openingTime =
              item['features']['accessPeriod']['start'] as String;
          final closingTime = item['features']['accessPeriod']['end'] as String;

          print('44444');
          print(amount);
          print(category);
          print(description);
          print(closingTime);
          print(id);

          // print(logo);

          final gymplans = gymPlans(
              id: id,
              amount: amount.toString(),
              category: category,
              description: description,
              openingTime: openingTime,
              closingTime: closingTime,
              visitsPerMonth: visitsPerMonth.toString(),
              priviledges: '');
          thisGymPlans.add(gymplans);

          // thisGymList.value = gymList;

          // print('555555');
          // print(_gymList);
        }
//       locationList.value = data.
// //map((e) => GymLocations.fromJson(e)).toList();

        update();
      } else {
        isGymPlanLoading(false);
        Get
          ..snackbar('session expired', 'login to continue',
              backgroundColor: errorLight);
        Get.offAndToNamed(Routes.gymOwnerLogin);
      }
    } catch (e) {
      Get.snackbar('error', '$e', backgroundColor: errorDark);
    }
    isGymPlanLoading(false);
  }

  Future<void> deletGymPlan(String id) async {
    await Future.delayed(Duration(seconds: 5));
    try {
      print('deleting plans');

      final box = await Hive.openBox('gymOwnerData');
      final token = box.get('token', defaultValue: '');
      print(token);

      print(id);
      final response = await http.delete(
        Uri.parse('https://riilfit-api.vercel.app/gyms/manage/plans/$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print(response.body);
      // isLoading.value = false;
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        print(jsonResponse);

        // print(data);
        Get
          ..snackbar(
            '',
            'plan deleted successfully',
          );
        deleted.value = true;
      } else {
        Get
          ..snackbar('session expired', 'login to continue',
              backgroundColor: errorLight);
        Get.offAndToNamed(Routes.gymOwnerLogin);
      }
    } catch (e) {
      Get.snackbar('error', '$e', backgroundColor: errorDark);
    }
  }
}
