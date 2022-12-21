import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/login/login.dto.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
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
    text: kDebugMode ? 'Riilfit123!@#' : null,
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
      //Validate form
      loginFormKey.currentState!.save();
      if (!loginFormKey.currentState!.validate()) {
        showFlushBar(
          message: 'Kindly fix validation issues',
        );
        return;
      }
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
          jsonEncode(res.payload['user']),
        );

        unawaited(
          Get.offAllNamed<void>(
            Routes.app,
          ),
        );
        viewState = ViewState.idle;
      } else {
        showFlushBar(
          message: res.message ?? errorMessage,
        );
        viewState = ViewState.idle;
      }
    } on SocketException catch (e, s) {
      print('SOCKETEXECPTION');
      log(
        e.toString(),
        stackTrace: s,
      );
      showFlushBar(
        message: errorMessage,
      );
      viewState = ViewState.idle;
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

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}

  void navigateToForgotPassword() {
    Get.toNamed<void>(
      Routes.forgotPasswordInit,
    );
  }
}
