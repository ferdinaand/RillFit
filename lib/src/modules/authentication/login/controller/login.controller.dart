import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> loginFormKey;

  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    super.onInit();
  }

  //text field controllers
  final emailOrPhoneController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
  );

  final passwordController = TextEditingController(
    text: kDebugMode ? 'WAGMI12345' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value =
        emailOrPhoneController.text.isEmpty || passwordController.text.isEmpty;

    return;
  }

  void navigateToRegisterPage() {
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  Future<void> login() async {
    unawaited(
      Get.offAllNamed<void>(
        Routes.app,
      ),
    );
  }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}

  void navigateToForgotPassword() {
    Get.toNamed<void>(
      Routes.forgotPasswordInit,
    );
  }
}
