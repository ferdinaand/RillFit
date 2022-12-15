import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/storage.service.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class AppGuard extends GetMiddleware {
  final storageService = Get.find<StorageService>();

  @override
  RouteSettings? redirect(String? route) {
    final hasToken = storageService.isLoggedIn;
    print(route == Routes.onboarding);
    print(hasToken);
    if (route == Routes.onboarding && hasToken) {
      return const RouteSettings(
        name: Routes.login,
      );
    }
    return null;
  }
}
