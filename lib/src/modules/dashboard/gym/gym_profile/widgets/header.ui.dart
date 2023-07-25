import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/extensions/extensions.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymProfileHeaderUi extends GetView<HomeController> {
  const GymProfileHeaderUi({
    super.key,
  });

  @override
  HomeController get controller => Get.put(HomeController());

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
            const TextUi.bodyMed(
              'user',
              style: TextStyle(fontStyle: FontStyle.italic),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        const Spacer(),
        ProfileAvatar(
          onTap: () {},
        ),
      ],
    );
  }
}
