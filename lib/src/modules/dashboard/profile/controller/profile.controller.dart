import 'dart:developer';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/utils/config.dart';

class ProfileController extends BaseController {
  // String get firstName => currentUser.firstName;
  String firstname = firstName;
  String phonenumber = phoneNumber;

  var isLoading = false.obs;
  Future<void> createVendorAccount() async {}

  //logout
  Future<void> logout() async {
    userName = "";
    firstName = '';
    phoneNumber = '';
    // await AuthApi().logout();

    await storageService.deleteAllItems();
    Get.snackbar('', 'logged out successfully ');
    await Get.offAllNamed<void>(
      Routes.chooseRole,
    );
    Get.snackbar('', 'logged out successfully ');
  }
}
