// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riilfit/src/data/Models/GymOwner.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../register/controller/Gym_Owner_Register_controller.dart';

class GymOwnerLoginController extends BaseController {
  late GlobalKey<FormState> loginFormKey;
  SharedPreferences? pref;
  var isLoading = false.obs;
  Rx<gymOwnerDetails> thisGymOwnerDetails = gymOwnerDetails().obs;
  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Gym Login');
    initSharedPref();
    super.onInit();
  }

  void initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  //text field controllers
  final usernameController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  final passwordController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value =
        usernameController.text.isEmpty || passwordController.text.isEmpty;
    print('isButtonDisabled: ${isButtonDisabled.value}');
    return;
  }

  void navigateToRegisterPage() {
    routeFromUserSignin = true;
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  /////persiting user login in data with hive
  void persistData(String token) async {
    Box box1 = await Hive.openBox('GymOwnerData');
    box1
      ..put('token', token)
      ..put('UserName', usernameController.text);
  }

  ///  login with node js backend
  ///
  ///
  ///
  ///
  Future<void> login() async {
    // try {
    final signupBody = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    isLoading.value = true;
    var response = await http.post(
      Uri.parse('https://riilfit-api.vercel.app/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signupBody),
    );

    final jsonResponse = jsonDecode(response.body);

    await Future.delayed(Duration(seconds: 3));

    if (jsonResponse['access_token'] != null) {
      final token = jsonResponse['access_token'].toString();
      print('something here');
      print(token);

      persistData(token);

      // Decode the JWT token
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('userType')) {
        final userType = decodedToken['userType'];

        if (userType == "GYM_OWNER") {
          // Navigate to gym owner dashboard
          Get.snackbar('success', 'signed in successfully');
          await fetchUserProfile(token);
          await Get.offAllNamed<void>(Routes.gymOwnerHome);
          isLoading.value = false;
        } else if (userType == "REGULAR") {
          // Navigate to regular user dashboard
          Get.snackbar('', 'wrong credentials');
          isLoading.value = false;
        } else {
          // Handle other user types or scenarios
          // ...
          Get.snackbar('', 'wrong credentials');
          isLoading.value = false;
        }
      } else {
        // Handle the case when 'userType' is not present in the token
        // ...
        Get.snackbar('', 'wrong credentials');
        isLoading.value = false;
      }
    } else if (jsonResponse['statusCode'] != null) {
      Get.snackbar('Error', 'incorrect username or password');
      isLoading.value = false;
    }
    // } catch (e) {
    //   Get.snackbar('', '$e');
    // }
    isLoading.value = false;
  }

  Future<void> fetchUserProfile(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('https://riilfit-api.vercel.app/users/profile'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final gymOwnerProfile = jsonDecode(response.body);
        final data = gymOwnerProfile['data'];
        // print(data);
        thisGymOwnerDetails.value = gymOwnerDetails.fromJson(data);

        // Store the user profile details and access token in Hive
        final box = await Hive.openBox('gymOwnerData');
        await box.put(
            'fullname', thisGymOwnerDetails.value.fullname.toString());
        await box.put('username', thisGymOwnerDetails.value.gymName.toString());

        await box.put(
            'phone', thisGymOwnerDetails.value.phoneNumber.toString());
        await box.put('Id', thisGymOwnerDetails.value.gymOwnerId.toString());
        await box.put(
            'user_type', thisGymOwnerDetails.value.userType.toString());
      } else {
        // Handle the error when fetching user profile fails
        print('Failed to fetch user profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any network or other errors
      print('Error fetching user profile: $e');
    }
  }

  // try {
  //   //Validate form
  //   loginFormKey.currentState!.save();
  //   if (!loginFormKey.currentState!.validate()) {
  //     showFlushBar(
  //       message: 'Kindly fix validation issues',
  //     );
  //     return;
  //   }
  //   viewState = ViewState.busy;

  //   final loginDto = LoginDto(
  //     emailPhone: emailOrPhoneController.text,
  //     password: passwordController.text,
  //   );

  //   final res = await AuthApi().login(
  //     loginDto: loginDto,
  //   );

  //   if (res.success) {
  //     //store token
  //     await storageService.cacheAuthToken(
  //       res.payload['token'] as String,
  //     );

  //     //store user
  //     await storageService.cacheCustomer(
  //       jsonEncode(res.payload['user']),
  //     );

  //     unawaited(
  //       Get.offAllNamed<void>(
  //         Routes.app,
  //       ),
  //     );
  //     viewState = ViewState.idle;
  //   } else {
  //     showFlushBar(
  //       message: res.message ?? errorMessage,
  //     );
  //     viewState = ViewState.idle;
  //   }
  // } on SocketException catch (e, s) {
  //   print('SOCKETEXECPTION');
  //   log(
  //     e.toString(),
  //     stackTrace: s,
  //   );
  //   showFlushBar(
  //     message: errorMessage,
  //   );
  //   viewState = ViewState.idle;
  // } catch (e, s) {
  //   log(
  //     e.toString(),
  //     stackTrace: s,
  //   );
  //   showFlushBar(
  //     message: errorMessage,
  //   );
  //   viewState = ViewState.idle;
  // } finally {
  //   viewState = ViewState.idle;
  // }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}

  void navigateToForgotPassword() {
    Get.toNamed<void>(
      Routes.forgotPasswordInit,
    );
  }
}
