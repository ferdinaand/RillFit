import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/train/controller/train.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class TrainSearchFieldUi extends GetView<TrainController> {
  const TrainSearchFieldUi({
    super.key,
  });

  @override
  TrainController get controller => Get.put(TrainController());

  @override
  Widget build(BuildContext context) {
    return SearchFieldUi(
      controller: controller.searchController,
      hintText: 'Search for gym routines e.g abs, leg day',
      onChanged: controller.searchTrainings,
    );
  }
}
