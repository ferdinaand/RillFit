import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/dto.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
import 'package:riilfit/src/routing/app_pages.dart';
// import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';

class ForgotPasswordEnterResetOtpController extends GetxController {
  @override
  void onInit() {
    userEmail = Get.arguments as String? ?? '';
    enableButton();
    super.onInit();
  }

  late String userEmail;
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
      try {
        final resetPasswordDto = ResetPasswordDto(
          otp: pinController.text,
          email: userEmail,
        );
        viewState = ViewState.busy;

        final res = await AuthApi().verifyResetCode(
          resetPasswordDto: resetPasswordDto,
        );

        if (res.success) {
          unawaited(
            Get.offNamed<void>(
              Routes.forgotPasswordSetNewPassword,
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
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
    }
  }
}
