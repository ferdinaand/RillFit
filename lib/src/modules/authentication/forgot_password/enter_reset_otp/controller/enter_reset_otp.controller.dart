import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/reset.otp/enter_reset_otp.dto.dart';
import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class ForgotPasswordEnterResetOtpController extends GetxController {
  final AuthRepositories _repositories = AuthRepositories();
  @override
  void onInit() {
    enableButton();
    super.onInit();
  }

  //text field controllers
  final pinController = TextEditingController(
    text: kDebugMode ? '123456' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = pinController.text.isEmpty;

    return;
  }

  void resendCode() {}

  Future<void> verifyRecoveryCode() async {
   await AuthRepositories.storeOtp(pinController.text);
    unawaited(
      Get.toNamed<void>(
        Routes.forgotPasswordSetNewPassword,
        arguments: pinController.text,
      ),
    );
  }
}
