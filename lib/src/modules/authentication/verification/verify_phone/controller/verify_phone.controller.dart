import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/strings.res.dart';
import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class VerifyPhoneController extends BaseController {
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
    isButtonDisabled.value =
        pinController.text.isEmpty || pinController.text.length != pinLength;

    return;
  }

  Future<void> resendCode() async {
    try {
      viewState = ViewState.busy;

      final user = await storageService.fetchCustomer();

      final res = await AuthApi().initPhoneVerification(
        email: user?.email ?? '',
      );

      viewState = ViewState.idle;

      return;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
      showFlushBar(
        message: errorMessage,
      );
      viewState = ViewState.idle;
    } finally {
      viewState = ViewState.idle;
    }
  }

  void changePhoneNumber() {
    Get.back<void>();
  }

  Future<void> verifyPhoneNumber() async {
    try {
      if (pinController.text.length != pinLength) {
        showFlushBar(
          message: 'Pin must be 6 digits',
        );
        return;
      }

      viewState = ViewState.busy;

      final res = await AuthApi().verifyPhone(
        code: pinController.text,
      );

      if (res.success) {
        unawaited(
          Get.offAllNamed<void>(
            Routes.home,
          ),
        );

        viewState = ViewState.idle;
      } else {
        showFlushBar(
          message: res.message ?? '',
        );
        viewState = ViewState.idle;
      }
      return;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
      showFlushBar(
        message: errorMessage,
      );
      viewState = ViewState.idle;
    } finally {
      viewState = ViewState.idle;
    }
  }
}
