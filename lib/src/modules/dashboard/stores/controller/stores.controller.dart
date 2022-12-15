import 'package:flutter/material.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class StoresController extends BaseController {
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  late TextEditingController searchController;

  void searchStores(String? query) {}
}
