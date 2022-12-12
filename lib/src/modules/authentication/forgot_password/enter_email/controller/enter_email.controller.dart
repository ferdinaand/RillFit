import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/enter.email/enterEmail.dto.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/data/remote_data_source/other_services/auth_repositories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ForgotPasswordEnterEmailController extends GetxController {
  late GlobalKey<FormState> forgotPasswordInitFormKey;
   final AuthRepositories _repositories = AuthRepositories();
   static const storage = FlutterSecureStorage();
  @override
  void onInit() {
    enableButton();
    forgotPasswordInitFormKey = GlobalKey<FormState>(
      debugLabel: 'Forgot password,enter email form',
    );
    super.onInit();
  }

  //text field controllers
  final emailController = TextEditingController(
    text: kDebugMode ? 'seundavid56@gmail.com' : null,
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
  
    final  enterEmailDto = EnterEmailDto(
          email: emailController.text,         
          );
    await AuthRepositories.storeEmail(emailController.text);
    await _repositories.authPost(enterEmailDto, '/user/initResetPassword');
    await _repositories.getAuth('/sms/check-verification-code');
    unawaited(
      Get.toNamed<void>(
        Routes.forgotPasswordEnterOtp,
        arguments: emailController.text,
      ),
    );
  }
}
