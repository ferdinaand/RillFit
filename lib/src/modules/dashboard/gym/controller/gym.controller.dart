import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GymController extends GetxController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchGyms(String? query) {}
}
