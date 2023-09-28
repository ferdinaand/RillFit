import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:riilfit/src/presentation/widgets.dart';

import '../../controller/gymOwnerLogin.controller.dart';

class GymOwnerLoginFormUi extends GetView<GymOwnerLoginController> {
  const GymOwnerLoginFormUi({super.key});

  @override
  GymOwnerLoginController get controller => Get.put(GymOwnerLoginController());

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
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldUi(
              hintText: 'username',
              controller: controller.usernameController,
              keyboardType: TextInputType.text,
              onChanged: (_) {
                controller.enableButton();
                print('Inside onChanged callback: $_');
              },
            ),
            const Gap(12),
            PasswordFieldUi(
              hintText: 'Password',
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
