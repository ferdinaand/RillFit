// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  ///  login with node js backend
  ///
  ///
  ///
  ///
  Future<void> login() async {
    final signupBody = {
      'email': usernameController.text,
      'password': passwordController.text,
    };

    var response = await http.post(
        Uri.parse('https://riilfit-backend.vercel.app/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(signupBody));

    final jsonResponse = jsonDecode(response.body);

    // print(jsonResponse['access_token']);
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));

    if (jsonResponse['access_token'] != null) {
      Get.snackbar('success', 'Logged in successfully');
      final token = jsonResponse;
      if (token != null) {
        await pref?.setString('token', token.toString());
      }

      await Get.offAllNamed<void>(
        Routes.app,
      );
    } else if (jsonResponse['statusCode'] != null) {
      Get.snackbar('Error', 'incorrect email or password');
      // print(jsonResponse.toString());
    }
    isLoading.value = false;
//login with firebase
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: emailOrPhoneController.text,
    //       password: passwordController.text);

    //   await Get.offAllNamed<void>(
    //     Routes.app,
    //   );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     Get.snackbar('no user', 'No user found for that email');
    //   } else if (e.code == 'wrong-password') {
    //     Get.snackbar('wrong password', 'wrong password provided for that user');
    //   } else if (e.code == 'network-request-failed') {
    //     Get.snackbar(
    //         'Network error', 'please check your connection and try again');
    //   }
    // }
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
