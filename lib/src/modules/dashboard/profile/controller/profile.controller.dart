import 'dart:developer';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class ProfileController extends BaseController {
  String get firstName => currentUser.firstName;

  var isLoading = false.obs;
  Future<void> createVendorAccount() async {}

  Future<void> logout() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 20));

    // await AuthApi().logout();

    // await storageService.deleteAllItems();

    Get.snackbar('', 'logged out successfully ');
    isLoading.value = false;
  }
}
