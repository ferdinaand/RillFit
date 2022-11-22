import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/forgot_password/enter_email/controller/enter_email.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class EnterEmailForgotPasswordFormUi
    extends GetView<EnterEmailForgotPasswordController> {
  const EnterEmailForgotPasswordFormUi({super.key});

  @override
  EnterEmailForgotPasswordController get controller =>
      Get.put(EnterEmailForgotPasswordController());

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
