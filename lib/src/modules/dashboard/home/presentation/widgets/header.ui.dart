import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/extensions/extensions.dart';
import 'package:riilfit/src/modules/dashboard/home/controller/home.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

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
                const TextUi.bodyLarge(
                  'Hi ',
                ),
                Obx(
                  () => TextUi.bodyLarge(
                    '${controller.firstName.capitalizeFirstLetter} 👋🏾',
                  ),
                ),
              ],
            ),
            const TextUi.bodySmall(
              'Good morning, How are you...',
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
