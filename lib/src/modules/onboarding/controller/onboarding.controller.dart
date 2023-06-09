import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/base/controller/base.controller.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class OnboardingController extends BaseController {
  @override
  void onInit() {
    pageController = PageController();
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      autoAnimatePages,
    );
    super.onInit();
  }

  late PageController? pageController;
  late Timer? _timer;

  void autoAnimatePages(Timer timer) {
    if (pageController == null) {
      return;
    }

    if (pageController?.positions.isEmpty ?? false) {
      return;
    }

    if (currentIndex < 2) {
      pageController?.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      currentIndex = 0;
      pageController?.jumpToPage(
        currentIndex,
      );
    }
  }

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  void navigateToLoginPage() {
    Get.toNamed<void>(
      Routes.login,
    );
  }

  void navigateToChooseRolePage() {
    Get.toNamed<void>(Routes.chooseRole);
  }

  @override
  void onClose() {
    pageController?.dispose();
    pageController = null;
    _timer?.cancel();
    _timer = null;
    super.onClose();
  }
}
