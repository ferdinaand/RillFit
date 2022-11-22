import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneController extends GetxController {
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

  void changePhoneNumber() {
    Get.back<void>();
  }

  Future<void> verifyPhoneNumber() async {}
}
