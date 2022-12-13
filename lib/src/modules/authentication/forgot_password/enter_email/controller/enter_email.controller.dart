import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
// import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';

class ForgotPasswordEnterEmailController extends BaseController {
  late GlobalKey<FormState> forgotPasswordInitFormKey;

  @override
  void onInit() {
    enableButton();
    forgotPasswordInitFormKey = GlobalKey<FormState>(
      debugLabel: 'Forgot password, enter email form',
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
    Get.back<void>();
  }

  Future<void> sendOtpToEmail() async {
    try {
      // await AuthRepositories.storeEmail(emailController.text);
      // viewState = ViewState.busy;
      // await _repositories.authPost(enterEmailDto, '/user/initResetPassword');

      // viewState = ViewState.idle;
      // unawaited(
      //   Get.toNamed<void>(
      //     Routes.forgotPasswordEnterOtp,
      //     arguments: emailController.text,
      //   ),
      // );
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
    }
  }
}
