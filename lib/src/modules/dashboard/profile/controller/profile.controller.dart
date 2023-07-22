import 'dart:developer';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';

class ProfileController extends BaseController {
  String get firstName => currentUser.firstName;

  var isLoading = false.obs;
  Future<void> createVendorAccount() async {}

  //logout
  Future<void> logout() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    // await AuthApi().logout();

    await storageService.deleteAllItems();
    await Get.offAllNamed<void>(
      Routes.onboarding,
    );
    Get.snackbar('', 'logged out successfully ');
    isLoading.value = false;
  }
}
