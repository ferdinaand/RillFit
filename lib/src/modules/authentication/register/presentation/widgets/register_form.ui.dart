import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/controller/register.controller.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class RegisterFormUi extends GetView<RegisterController> {
  const RegisterFormUi();

  @override
  RegisterController get controller => Get.put(RegisterController());

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
              hintText: "Full name",
              controller: controller.nameController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(12),
            TextFieldUi(
              hintText: "Email address",
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            const Gap(12),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: border(grayScale700),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 29.3,
                    child: Row(
                      children: const [
                        Text(
                          'NGR ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: primary,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
                TextFieldUi(
                  hintText: "Phone number",
                  controller: controller.phoneController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) {
                    controller.enableButton();
                  },
                ),
              ],
            ),
            const Gap(12),
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
