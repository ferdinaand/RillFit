import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/new_password/newPassword.dto.dart';
import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';

class ForgotPasswordSetNewPasswordController extends GetxController {
  late GlobalKey<FormState> setNewPasswordFormKey;
  final AuthRepositories _repositories = AuthRepositories();
  @override

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
        confirmNewPasswordController.text.isEmpty ||
        newPasswordController.text != confirmNewPasswordController.text;

    return;
  }

  Future<void> setNewPassword() async {
    final otp = await AuthRepositories.getOTP();
    // ignore: omit_local_variable_types
    final String userOtp = otp.toString();
    final email = await AuthRepositories.getEmail();
    // ignore: omit_local_variable_types
    final String userEmail = email.toString();
    final newPasswordDto = NewPasswordDto(
      newPassword: newPasswordController.text, 
      otp:userOtp, //userOtp store in secure flutter package
      email: userEmail, //userEmail Stored in secure flutter package
      );
      await _repositories.authPost(newPasswordDto, '/user/finishResetPassword');
  }
}
