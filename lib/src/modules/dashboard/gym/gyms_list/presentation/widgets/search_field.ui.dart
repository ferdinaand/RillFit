import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gyms_list/controller/gym.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class GymSearchFieldUi extends GetView<GymController> {
  const GymSearchFieldUi({
    super.key,
  });

  @override
  GymController get controller => Get.put(GymController());

  @override
  Widget build(BuildContext context) {
    return SearchFieldUi(
      controller: controller.searchController,
      hintText: 'Search for gym near you',
      onChanged: controller.searchGyms,
    );
  }
}
