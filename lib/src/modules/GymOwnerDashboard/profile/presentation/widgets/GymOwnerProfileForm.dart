import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../presentation/widgets.dart';
import '../../controller/gymOwnerProfileController.dart';

class ProfileEditForm extends GetView<GymOwnerProfileController> {
  const ProfileEditForm({super.key});

  @override
  GymOwnerProfileController get controller =>
      Get.put(GymOwnerProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(31),
        const Row(
          children: [
            TextUi.bodyLarge(
              'Full name',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        const Gap(7),
        SizedBox(
          child: TextFieldUi(
            onChanged: (_) {
              // controller.enableButton();
            },
            hintText: 'enter your Full Name',
            controller: controller.fullnameController,
          ),
        ),
        const Gap(20),
        const Row(
          children: [
            TextUi.bodyLarge(
              'Gym name',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        const Gap(7),
        SizedBox(
          child: TextFieldUi(
            onChanged: (_) {
              // controller.enableButton();
            },
            hintText: 'enter your Gym Name',
            controller: controller.gymNameController,
          ),
        ),
        const Gap(15),
        const Row(
          children: [
            TextUi.bodyXL(
              'Gym Location Detail',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        const Gap(20),

        //Gym lodation details form
        Row(
          children: [
            Column(
              children: [
                const Row(
                  children: [
                    TextUi.bodyLarge(
                      'State',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                const Gap(7),
                SizedBox(
                  width: 100.w,
                  child: TextFieldUi(
                    onChanged: (_) {
                      // controller.enableButton();
                    },
                    hintText: '',
                    controller: controller.gymStateController,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Column(
              children: [
                const Row(
                  children: [
                    TextUi.bodyLarge(
                      'City',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                const Gap(7),
                SizedBox(
                  width: 100.w,
                  child: TextFieldUi(
                    onChanged: (_) {
                      // controller.enableButton();
                    },
                    hintText: '',
                    controller: controller.gymCityController,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Column(
              children: [
                const Row(
                  children: [
                    TextUi.bodyLarge(
                      'Address',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                const Gap(7),
                SizedBox(
                  width: 100.w,
                  child: TextFieldUi(
                    onChanged: (_) {
                      // controller.enableButton();
                    },
                    hintText: '',
                    controller: controller.gymAddressController,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Gap(20),
        const Row(
          children: [
            TextUi.bodyLarge(
              'Gym Phone-number',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        const Gap(7),
        SizedBox(
          child: TextFieldUi(
            onChanged: (_) {
              // controller.enableButton();
            },
            hintText: 'enter your Gym phone number',
            controller: controller.gymNameController,
          ),
        ),
        const Gap(15),
      ],
    );
  }
}
