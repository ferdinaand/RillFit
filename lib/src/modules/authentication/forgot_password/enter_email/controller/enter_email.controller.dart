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
    text: kDebugMode ? '' : null,
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
      viewState = ViewState.busy;

      final res = await AuthApi().initResetPassword(
        email: emailController.text,
      );

      if (res.success) {
        unawaited(
          Get.toNamed<void>(
            Routes.forgotPasswordEnterOtp,
            arguments: emailController.text,
          ),
        );
        viewState = ViewState.idle;
      } else {
        showFlushBar(
          message: res.message ?? errorMessage,
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
