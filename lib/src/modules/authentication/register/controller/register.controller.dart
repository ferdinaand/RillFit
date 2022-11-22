import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class RegisterController extends GetxController {
  late GlobalKey<FormState> loginFormKey;

  @override
  void onInit() {
    enableButton();
    loginFormKey = GlobalKey<FormState>(debugLabel: 'Login');
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
    text: kDebugMode ? 'WAGMI12345' : null,
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
    unawaited(
      Get.toNamed<void>(
        Routes.verifyPhone,
      ),
    );
  }

  Future<void> loginViaFacebook() async {}
  Future<void> loginViaGoogle() async {}
}
