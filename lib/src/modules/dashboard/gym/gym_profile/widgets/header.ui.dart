import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/extensions/extensions.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_profile/controller/gym_profile_controller.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymProfileHeaderUi extends GetView<GymProfileController> {
  const GymProfileHeaderUi({
    super.key,
  });

  @override
  GymProfileController get controller => Get.put(GymProfileController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const TextUi.bodySmall(
              fontSize: 23,
              'Hi, ',
              fontWeight: FontWeight.w800,
            ),
            Obx(
              () => TextUi.bodyMed(
                '${controller.name}👋🏽',
                style: TextStyle(fontStyle: FontStyle.italic),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
        const Spacer(),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/png/profileFace.png'))),
        ),
      ],
    );
  }
}
