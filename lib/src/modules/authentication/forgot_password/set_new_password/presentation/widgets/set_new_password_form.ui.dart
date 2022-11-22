import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/forgot_password/set_new_password/controller/set_new_password.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ForgotPasswordSetNewPasswordFormUi
    extends GetView<ForgotPasswordSetNewPasswordController> {
  const ForgotPasswordSetNewPasswordFormUi({super.key});

  @override
  ForgotPasswordSetNewPasswordController get controller =>
      Get.put(ForgotPasswordSetNewPasswordController());

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
        key: controller.setNewPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PasswordFieldUi(
              hintText: 'Enter your new password',
              autofocus: true,
              controller: controller.newPasswordController,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(12),
            PasswordFieldUi(
              hintText: 'Re-enter your new password',
              controller: controller.confirmNewPasswordController,
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
