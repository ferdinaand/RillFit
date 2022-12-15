import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/stores/controller/stores.controller.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class StoresSearchFieldUi extends GetView<StoresController> {
  const StoresSearchFieldUi({
    super.key,
  });

  @override
  StoresController get controller => Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    return SearchFieldUi(
      controller: controller.searchController,
      hintText: 'Search for gym stores near you',
      onChanged: controller.searchStores,
    );
  }
}
