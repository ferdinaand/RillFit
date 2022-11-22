import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    pageController = PageController();
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      autoAnimatePages,
    );
    super.onInit();
  }

  late PageController pageController;
  late Timer _timer;

  void autoAnimatePages(Timer timer) {
    if (currentIndex < 2) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
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

  void navigateToRegisterPage() {
    Get.toNamed<void>(
      Routes.register,
    );
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
    _timer.cancel();
  }
}
