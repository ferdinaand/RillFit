import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainController extends GetxController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchTrainings(String? query) {}
}