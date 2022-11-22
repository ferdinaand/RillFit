import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/forgot_password/enter_reset_otp/controller/enter_reset_otp.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ForgotPasswordEnterResetOtpFormUi
    extends GetView<ForgotPasswordEnterResetOtpController> {
  const ForgotPasswordEnterResetOtpFormUi({super.key});

  @override
  ForgotPasswordEnterResetOtpController get controller =>
      Get.put(ForgotPasswordEnterResetOtpController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: controller.forgotPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldUi(
              hintText: 'Email Address',
              autofocus: true,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
          ],
        ),
      ),
    );
  }
}
