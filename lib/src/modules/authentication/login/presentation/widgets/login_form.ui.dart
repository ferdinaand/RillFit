import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class LoginFormUi extends GetView<LoginController> {
  const LoginFormUi();

  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldUi(
              hintText: "Email Address",
              controller: controller.emailOrPhoneController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(16),
            PasswordFieldUi(
              hintText: "Password",
              controller: controller.passwordController,
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
