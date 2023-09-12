// ignore_for_file: omit_local_variable_types, require_trailing_commas, avoid_void_async, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:mono_flutter/mono_flutter.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:http/http.dart' as http;
import '../../../../../routing/app_pages.dart';
import 'dart:async';
import 'dart:convert';

class GymPlansController extends BaseController {
  final iD = ''.obs;
  final isLoading = false.obs;
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void getPlanId() {}

  void gymsInLocation() {
    navigationService.navigateTo(
      Routes.gym,
    );
  }

  void tag() {
    navigationService.navigateTo(
      Routes.gymTag,
    );
  }

  final planController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value == planController.text.isEmpty;
    return;
  }

  void handlePayment(BuildContext context) async {
    MonoFlutter().launch(
      context,
      'test_pk_ku8af8e0gc6hibayqx5b',

      // reAuthCode: 'code_7ZSg9UB0sZsMSL3ygb6X',
      reference: DateTime.now().millisecondsSinceEpoch.toString(),
      config: {
        "selectedInstitution": {
          "id": "5f2d08bf60b92e2888287703",
          "auth_method": "internet_banking"
        }
      },
      onEvent: (event, data) {
        if (kDebugMode) print('event: $event, data: $data');
      },
      onClosed: () {
        if (kDebugMode) print('Modal closed');
      },
      onLoad: () {
        if (kDebugMode) print('Mono loaded successfully');
      },
      onSuccess: (code) {
        if (kDebugMode) print('Mono Success $code');
        getGymQr();
      },
    );
  }

  //select a city when clicked
  final RxString selectedPlanId = ''.obs;

  final RxString selectedPlanPrice = ''.obs;

  final RxString selectedPlanType = ''.obs;

  final RxString subscribersName = ''.obs;

  void setSelectedPlan(
      String plan, String price, String type, String subscriberName) {
    selectedPlanId.value = plan;
    selectedPlanPrice.value = price;
    selectedPlanType.value = type;
    subscribersName.value = subscriberName;
  }
//++

  Future<void> getGymQr() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));

    navigationService.navigateTo(
      Routes.gymTag,
    );
    isLoading.value = false;
    // var signupBody = {
    //   "fullName": '',
    //   "gymName": '',
    //   "gymPhone": '',
    //   "logoUrl":
    //       "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80",
    //   "username": '',
    //   "password": ''
    // };

    // var response = await http.post(
    //     Uri.parse('https://riilfit-backend.vercel.app/auth/login'),
    //     headers: {"Content-Type": "application/json"},
    //     body: jsonEncode(signupBody));

    // final jsonResponse = jsonDecode(response.body);
    // return jsonResponse;
  }
}
