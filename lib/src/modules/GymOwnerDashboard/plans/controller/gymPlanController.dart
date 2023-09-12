import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:riilfit/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GymPlanController extends BaseController {
  void navigateToLoginScreen() {
    Get.offAndToNamed<void>(
      Routes.register,
    );
  }

  final isButtonDisabled = true.obs;
  void navigateToEditpPlanScreen() {
    Get.offAndToNamed<void>(
      Routes.editGymPlans,
    );
  }

  final planPriceController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planDescriptionController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planTypeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planOpenTimeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planCloseTimeController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planFeaturesController = TextEditingController(
    text: kDebugMode ? '' : null,
  );
  final planAccessDaysController = TextEditingController(
    text: kDebugMode ? '' : null,
  );

  void enableButton() {
    isButtonDisabled.value = planPriceController.text.isEmpty ||
        planDescriptionController.text.isEmpty ||
        planTypeController.text.isEmpty ||
        planOpenTimeController.text.isEmpty ||
        planCloseTimeController.text.isEmpty ||
        planFeaturesController.text.isEmpty ||
        planAccessDaysController.text.isEmpty;

    return;
  }

  void deletGymPlan() {}
  @override
  void onInit() {
    enableButton();
    // ChooseRoleRoute = false;
    super.onInit();
  }
}
