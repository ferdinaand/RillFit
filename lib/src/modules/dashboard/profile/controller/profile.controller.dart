import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_locations/controller/gym_locations_controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/utils/config.dart';

class ProfileController extends BaseController {
  // String get firstName => currentUser.firstName;
  // String firstname = firstName;
  // String phonenumber = phoneNumber;

  @override
  void onInit() {
    // Call fetchUserData here when the HomeController is initialized
    fetchUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  var fullname = ''.obs;
  var username = ''.obs;
  var phoneNumber = ''.obs;
  Future<void> createVendorAccount() async {}

  Future<void> clearUserData() async {
    final box = await Hive.openBox('userData');
    print(box.toString());
    await box.clear();
  }

  Future<void> fetchUserData() async {
    final userDataBox = await Hive.openBox('userData');
    final fullName = userDataBox.get('fullname', defaultValue: '');
    final username = userDataBox.get('username', defaultValue: '');
    final phoneNumber = userDataBox.get('phone', defaultValue: '');

    // Update the observable variables
    fullname.value = fullName.toString();
    this.username.value = username.toString();
    this.phoneNumber.value = phoneNumber.toString();

    // await userDataBox.close();
  }

  //logout
  Future<void> logout() async {
    // await AuthApi().logout();
    clearUserData();

    await storageService.deleteAllItems();

    await Get.offAllNamed<void>(
      Routes.chooseRole,
    );
  }
}
