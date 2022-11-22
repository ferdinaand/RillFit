import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/controller/register.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/themes/app.themes.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class RegisterFormUi extends GetView<RegisterController> {
  const RegisterFormUi({super.key});

  @override
  RegisterController get controller => Get.put(RegisterController());

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
              hintText: 'Full name',
              controller: controller.nameController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(12),
            TextFieldUi(
              hintText: 'Email address',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppThemes.isDarkMode ? grayScale700 : grayScale100,
                    ),
                    borderRadius: const BorderRadius.all(
                      smallRadius,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: const [
                      TextUi(
                        'NGR ',
                        style: bodySmall,
                      ),
                      Icon(
                        Icons.expand_more,
                        color: primary,
                        size: 24,
                      )
                    ],
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: TextFieldUi(
                    hintText: 'Phone number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) {
                      controller.enableButton();
                    },
                  ),
                ),
              ],
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
