import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final newPasswordController = TextEditingController(
    text: kDebugMode ? 'WAGMI1234' : null,
  );

  final confirmNewPasswordController = TextEditingController(
    text: kDebugMode ? 'WAGMI1234' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = newPasswordController.text.isEmpty ||
        confirmNewPasswordController.text.isEmpty;

    return;
  }

  Future<void> setNewPassword() async {}
}
