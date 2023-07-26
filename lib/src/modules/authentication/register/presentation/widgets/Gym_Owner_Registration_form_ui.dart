import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/enum/view_state.enum.dart';
import 'package:riilfit/src/modules/authentication/login/controller/login.controller.dart';
import 'package:riilfit/src/modules/authentication/register/presentation/widgets/Add_Image.dart';
import 'package:riilfit/src/presentation/widgets.dart';

import '../../../../../presentation/resources/colors.res.dart';
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
              // onChanged: (_) {
              //   controller.enableButton();
              // },
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Gym name',
              controller: controller.gymNameController,
              keyboardType: TextInputType.emailAddress,
              // onChanged: (_) {
              //   controller.enableButton();
              // },
            ),
            Gap(gap),
            TextUi.heading4(
              'gym location details',
              fontWeight: FontWeight.w300,
            ),
            Gap(5),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: TextFieldUi(
                    hintText: 'state',
                    controller: controller.gymStateController,
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (_) {
                    //   controller.enableButton();
                    // },
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: 100,
                  child: TextFieldUi(
                    hintText: 'city',
                    controller: controller.gymCityController,
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (_) {
                    //   controller.enableButton();
                    // },
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: 120,
                  child: TextFieldUi(
                    hintText: 'Address',
                    controller: controller.gymAddressController,
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (_) {
                    //   controller.enableButton();
                    // },
                  ),
                ),
              ],
            ),
            Gap(gap),
            TextFieldUi(
              hintText: 'Phone number',
              controller: controller.phoneController,
              keyboardType: TextInputType.emailAddress,
              // onChanged: (_) {
              //   controller.enableButton();
              // },
            ),
            Gap(gap),
            PasswordFieldUi(
              hintText: 'password',
              controller: controller.passwordController,
              // onChanged: (_) {
              //   controller.enableButton();
              // },
            ),
            Gap(30),
            Center(child: const AddImage()),
            const Gap(40),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primary,
                      ),
                    )
                  : PrimaryButtonUi(
                      text: 'Sign up',
                      loading: controller.viewState.isBusy,
                      onPressed:
                          //  controller.isButtonDisabled.value
                          //     ? null
                          //     :
                          controller.signup,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
