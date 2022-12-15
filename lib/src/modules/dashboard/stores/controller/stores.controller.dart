import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresController extends GetxController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchStores(String? query) {}
}
