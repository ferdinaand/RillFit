import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/extensions/extensions.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';
import 'package:riilfit/src/utils/config.dart';

class HomeHeaderUi extends GetView<HomeController> {
  const HomeHeaderUi({
    super.key,
  });

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const TextUi.bodySmall(
                  fontSize: 14,
                  'WELCOME BACK ',
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            TextUi.bodyMed(
              userName != null ? userName.toUpperCase() : 'user',
              style: TextStyle(fontStyle: FontStyle.italic),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        const Spacer(),
        ProfileAvatar(
          onTap: controller.openGymProfilePage,
        ),
      ],
    );
  }
}
