import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class EnterEmailForgotPasswordController extends GetxController {
  late GlobalKey<FormState> forgotPasswordFormKey;

  @override
  void onInit() {
    enableButton();
    forgotPasswordFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    super.onInit();
  }

  //text field controllers
  final emailController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
  );

  //Enable and disable button logic
  final isButtonDisabled = true.obs;

  void enableButton() {
    isButtonDisabled.value = emailController.text.isEmpty;

    return;
  }

  void navigateToLoginPage() {
    Get.offAndToNamed<void>(
      Routes.login,
    );
  }

  Future<void> sendOtpToEmail() async {
    // Get.offAllNamed(
    //   Routes.home,
    // );
    AppThemes.changeThemeMode();
  }
}
