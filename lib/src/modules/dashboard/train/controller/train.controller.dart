import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class TrainController extends BaseController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchTrainings(String? query) {}
}
