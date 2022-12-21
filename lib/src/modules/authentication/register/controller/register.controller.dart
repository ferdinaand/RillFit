import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/dto.dart';
import 'package:riilfit/src/data/enum/error_type.enum.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/data/extensions/string.extensions.dart';
import 'package:riilfit/src/domain/api/auth/auth.api.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/presentation/resources/strings.res.dart';
import 'package:riilfit/src/presentation/utility/flushbar/show-flushbar.helper.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class RegisterController extends BaseController {
  late GlobalKey<FormState> registerFormKey;

  @override
  void onInit() {
    enableButton();
    registerFormKey = GlobalKey<FormState>(debugLabel: 'Register');
    super.onInit();
  }

  //text field controllers
  final nameController = TextEditingController(
    text: kDebugMode ? 'Oluwaseun Odunlade' : null,
  );

  final emailController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
  );
  final phoneController = TextEditingController(
    text: kDebugMode ? '08083692937' : null,
  );

  final passwordController = TextEditingController(
    text: kDebugMode ? 'Password123!@#' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = emailController.text.isEmpty ||
        !emailController.text.isEmail ||
        nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty;

    return;
  }

  void navigateToLoginPage() {
    Get.offAndToNamed<void>(
      Routes.login,
    );
  }

  Future<void> signUp() async {
    try {
      //Validate form
      registerFormKey.currentState!.save();
      if (!registerFormKey.currentState!.validate()) {
        showFlushBar(
          message: 'Kindly fix validation issues',
        );
        return;
      }
      viewState = ViewState.busy;

      final registerDto = RegisterDto(
        email: emailController.text,
        phoneNumber: phoneController.text.addCountryCode,
        fullName: nameController.text,
        password: passwordController.text,
      );

      final res = await AuthApi().createAccount(
        registerDto: registerDto,
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
        showFlushBar(
          message: res.message ??
              'Signed up successfully, We have sent a verification code to ${phoneController.text}',
          errorType: ErrorType.success,
        );

        unawaited(
          Get.toNamed<void>(
            Routes.verifyPhone,
          ),
        );

        viewState = ViewState.idle;
      } else {
        if (res.message == passwordTooWeak) {
          showFlushBar(
            message: passwordTooWeak,
          );
        }
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

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}
}
