import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/routing/app_pages.dart';

class NavigationService extends GetxService {
  @override
  void onInit() {
    navigatorKey = GlobalKey<NavigatorState>();
    super.onInit();
  }

  late GlobalKey<NavigatorState> navigatorKey;

  void navigateTo(String routeName, {dynamic argument}) {
    return unawaited(
      Get.toNamed<void>(
        routeName,
        arguments: argument,
      ),
    );
  }

  void navigateToReplace(String routeName, {dynamic argument}) {
    return unawaited(
      Get.offNamed<void>(
        routeName,
        arguments: argument,
      ),
    );
  }

  void navigateToAndRemoveUntil(
    String routeName, {
    dynamic argument,
    String? endRoute,
  }) {
    return unawaited(
      Get.offNamedUntil(
        routeName,
        (route) {
          if (endRoute != null) {
            return route.settings.name == endRoute;
          }
          return false;
        },
        arguments: argument,
      ),
    );
  }

  void goBack({dynamic result}) {
    return Get.back(result: result);
  }

  void returnToDashboard() {
    Get.until(
      (route) => route.settings.name == Routes.home,
    );
  }

  void forceUserReAuth() {
    //if current route is login route, don't navigate.
    final isLoginTheCurrentRoute = Get.currentRoute == Routes.login;

    if (isLoginTheCurrentRoute) {
      return;
    }

    navigateToAndRemoveUntil(
      Routes.login,
      argument: false,
    );
  }

  void logout() {
    navigateToAndRemoveUntil(
      Routes.onboarding,
    );

    // navigateTo(
    //   Routes.login,
    //   argument: false,
    // );
  }
}
