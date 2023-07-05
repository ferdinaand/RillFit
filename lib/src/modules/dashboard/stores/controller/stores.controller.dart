import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

import '../../../../utils/config.dart';

class StoresController extends BaseController {
  @override
  void onInit() {
    searchController = TextEditingController();
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
    });
    super.onInit();
  }

  late TextEditingController searchController;

  void searchStores(String? query) {}
}
