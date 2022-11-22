import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';

class ForgotPasswordEnterResetOtpController extends GetxController {
  late GlobalKey<FormState> forgotPasswordFormKey;

  @override
  void onInit() {
    enableButton();
    forgotPasswordFormKey = GlobalKey<FormState>(debugLabel: 'Login');
    super.onInit();
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
    // Get.offAllNamed(
    //   Routes.home,
    // );
    AppThemes.changeThemeMode();
  }
}
