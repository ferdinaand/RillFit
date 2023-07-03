import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/widgets/Add_Image.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../controller/Gym_Owner_Register_controller.dart';

class GymOwnerRegistrationFormUi extends GetView<GymOwnerRegisterController> {
  const GymOwnerRegistrationFormUi({super.key});

  @override
  GymOwnerRegisterController get controller =>
      Get.put(GymOwnerRegisterController());

  @override
  Widget build(BuildContext context) {
    double gap = 12;
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
              hintText: 'FullName',
              controller: controller.fullnameController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Gym name',
              controller: controller.gymNameController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Gym Location',
              controller: controller.gymLocatioController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Phone number',
              controller: controller.phoneController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Email',
              controller: controller.emailOrPhoneController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(gap),
            PasswordFieldUi(
              hintText: 'password',
              controller: controller.passwordController,
              onChanged: (_) {
                controller.enableButton();
              },
            ),
            Gap(30),
            Center(child: const AddImage()),
            Gap(30)
          ],
        ),
      ),
    );
  }
}
