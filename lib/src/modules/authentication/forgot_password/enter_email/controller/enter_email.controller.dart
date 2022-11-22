import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class ForgotPasswordEnterEmailController extends GetxController {
  late GlobalKey<FormState> forgotPasswordFormKey;

  @override
  void onInit() {
    enableButton();
    forgotPasswordFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    super.onInit();
  }

  //text field controllers
  final emailController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value =
        emailController.text.isEmpty || !emailController.text.isEmail;

    return;
  }

  void navigateToLoginPage() {
    Get.offAndToNamed<void>(
      Routes.login,
    );
  }

  Future<void> sendOtpToEmail() async {
    unawaited(
      Get.toNamed<void>(
        Routes.forgotPasswordEnterOtp,
        arguments: emailController.text,
      ),
    );
  }
}
