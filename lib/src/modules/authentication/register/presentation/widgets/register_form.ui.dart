import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/register/controller/register.controller.dart';
import 'package:riilfit/src/presentation/global_widgets/phone_input_field.ui.dart';
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
        key: controller.registerFormKey,
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
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText:
                        'Your first and last name are required to proceed',
                  ),
                ],
              ),
            ),
            const Gap(12),
            TextFieldUi(
              hintText: 'Email address',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required(
                  errorText: 'A valid email address is required to proceed',
                ),
              ]),
            ),
            const Gap(12),
            PhoneInputField(
              controller: controller.phoneController,
              onChanged: (_) {
                controller.enableButton();
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
