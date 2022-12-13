import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/login/login.dto.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class LoginController extends BaseController {
  late GlobalKey<FormState> loginFormKey;

  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    super.onInit();
  }

  //text field controllers
  final emailOrPhoneController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
  );

  final passwordController = TextEditingController(
    text: kDebugMode ? 'WAGMI12345' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value =
        emailOrPhoneController.text.isEmpty || passwordController.text.isEmpty;

    return;
  }

  void navigateToRegisterPage() {
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  Future<void> login() async {
    try {
      viewState = ViewState.busy;

      final loginDto = LoginDto(
        emailPhone: emailOrPhoneController.text,
        password: passwordController.text,
      );

      final res = await AuthApi().login(
        loginDto: loginDto,
      );

      if (res.success) {
        //store token
        await storageService.cacheAuthToken(
          res.payload['token'] as String,
        );

        //store user
        await storageService.cacheCustomer(
          res.payload['user'] as String,
        );

        unawaited(
          Get.offAllNamed<void>(
            Routes.home,
          ),
        );
        viewState = ViewState.idle;
      } else {
        viewState = ViewState.idle;
      }
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
      viewState = ViewState.idle;
    } finally {
      viewState = ViewState.idle;
    }
  }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}

  void navigateToForgotPassword() {
    Get.toNamed<void>(
      Routes.forgotPasswordInit,
    );
  }
}
