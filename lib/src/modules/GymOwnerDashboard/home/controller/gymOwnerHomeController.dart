import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GymHomeController extends BaseController {
  var gymName = ''.obs;
  var fullName = ''.obs;

  void navigateToLoginScreen() {
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  @override
  void onInit() {
    fetchUserData();
    // ChooseRoleRoute = false;
    super.onInit();
  }

  void navigateToViewPlans() {
    navigationService.navigateTo(
      Routes.viewGymPlans,
    );
  }

  void navigateToEditProfile() {
    navigationService.navigateTo(
      Routes.gymOwnerProfile,
    );
  }

  Future<void> fetchUserData() async {
    final userDataBox = await Hive.openBox('gymOwnerData');
    final fullName = userDataBox.get('fullname', defaultValue: '');
    final username = userDataBox.get('username', defaultValue: '');
    final phoneNumber = userDataBox.get('phone', defaultValue: '');

    // Update the observable variables

    gymName.value = username.toString();
    this.fullName.value = fullName.toString();

    // await userDataBox.close();
  }

  Future<void> clearUserData() async {
    final box = await Hive.openBox('gymOwnerData');
    print(box.toString());
    await box.clear();
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

  void navigateToCreatePlans() {
    navigationService.navigateTo(
      Routes.createGymPlans,
    );
  }
}
