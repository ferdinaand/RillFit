import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleController extends BaseController {
  void navigateToLoginScreen() {
    Get.toNamed<void>(
      Routes.login,
    );
  }

  @override
  void onInit() {
    userSelect = false;
    GymOwnerSelect = false;
    ChooseRoleRoute = false;
    super.onInit();
  }

  var selectedUser = ''.obs;
  void selectuser(String user) {
    selectedUser.value = user;
  }
}
