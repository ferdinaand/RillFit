import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class GymController extends BaseController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchGyms(String? query) {}
}
