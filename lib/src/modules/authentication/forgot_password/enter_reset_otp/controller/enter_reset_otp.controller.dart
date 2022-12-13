import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
// import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';

class ForgotPasswordEnterResetOtpController extends GetxController {
  // final AuthRepositories _repositories = AuthRepositories();
  @override
  void onInit() {
    enableButton();
    super.onInit();
  }

  final _viewState = ViewState.idle.obs;
  ViewState get viewState => _viewState.value;
  set viewState(ViewState state) {
    _viewState.value = state;
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
    try {
      // viewState = ViewState.busy;

      // await _repositories.authPost(
      //   {
      //     'code': pinController.text,
      //   },
      //   '/sms/check-verification-code',
      // );
      // viewState = ViewState.idle;

      // unawaited(
      //   Get.toNamed<void>(
      //     Routes.forgotPasswordSetNewPassword,
      //     arguments: pinController.text,
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
