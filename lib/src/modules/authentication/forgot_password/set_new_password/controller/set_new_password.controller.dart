import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class ForgotPasswordSetNewPasswordController extends GetxController {
  late GlobalKey<FormState> setNewPasswordFormKey;

  @override
  void onInit() {
    enableButton();
    setNewPasswordFormKey = GlobalKey<FormState>(
      debugLabel: 'set new password forgot password flow',
    );
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
