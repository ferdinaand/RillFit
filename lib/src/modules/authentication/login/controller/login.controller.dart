// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riilfit/src/data/Models/Users.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../register/controller/Gym_Owner_Register_controller.dart';

class LoginController extends BaseController {
  late GlobalKey<FormState> loginFormKey;
  Rx<usersDetails> thisUserDetails = usersDetails().obs;
  SharedPreferences? pref;

  var isLoading = false.obs;
  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');
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

    return;
  }

  void navigateToRegisterPage() {
    routeFromUserSignin = true;
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  ///
  ///
  ///
  ///
  ///
  /////persiting user login in data with hive
  void persistData(String token) async {
    box1 = await Hive.openBox('userData');
    box1
      ..put('token', token)
      ..put('UserName', usernameController.text);
  }

  Future<void> login() async {
    final loginBody = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    isLoading.value = true;
    isLoggedIn = true;
    try {
      var response = await http.post(
          Uri.parse('https://riilfit-api.vercel.app/auth/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(loginBody));

      final jsonResponse = jsonDecode(response.body);

      // print(jsonResponse['access_token']);

      await Future.delayed(const Duration(seconds: 3));

      if (jsonResponse['access_token'] != null) {
        Get.snackbar('success', 'Logged in successfully');
        final token =
            jsonResponse['access_token'] as String; // Retrieve the access_token
        await fetchUserProfile(token);
        persistData(token);
        await Get.offAllNamed<void>(
          arguments: thisUserDetails.value.userName,
          Routes.app,
        );
      } else if (jsonResponse['statusCode'] != null) {
        Get.snackbar('Error', 'incorrect email or password');
        // print(jsonResponse.toString());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching user profile: $e');
    }
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
        final userProfile = jsonDecode(response.body);
        final data = userProfile['data'];
        // print(data);
        thisUserDetails.value = usersDetails.fromJson(data);
        // final homeController = Get.find<HomeController>();
        // final user = thisUserDetails.value.userName.toString();
        // final phone = thisUserDetails.value.phoneNumber.toString();
        // final name = thisUserDetails.value.fullName.toString();
        // // print(name);
        // homeController.updateUserInfo(name, user, phone);
        // print(thisUserDetails.value.gymId![0]);
        // Store the user profile details and access token in Hive
        final box = await Hive.openBox('userData');
        await box.put('fullname', thisUserDetails.value.fullName.toString());
        await box.put('username', thisUserDetails.value.userName.toString());
        await box.put('phone', thisUserDetails.value.phoneNumber.toString());
        await box.put('userId', thisUserDetails.value.userId.toString());
        await box.put('user_type', thisUserDetails.value.userType.toString());
        await box.put('gym', thisUserDetails.value.gymId.toString());
      } else {
        // Handle the error when fetching user profile fails
        print('Failed to fetch user profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any network or other errors
      print('Error fetching user profile: $e');
    }
  }

  //_______________________________________________________________________________

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
