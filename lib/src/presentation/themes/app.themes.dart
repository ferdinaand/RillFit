import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dark.theme.dart';
import 'light.theme.dart';

class AppThemes extends GetxService {
  AppThemes._();

  @override
  void onInit() {
    _isDarkMode(isDarkModeSaved());
    super.onInit();
  }

  static final light = lightTheme;
  static ThemeData dark = darkTheme;

  static final _storage = GetStorage();
  static const themeKey = "isDarkMode";

  static final _isDarkMode = isDarkModeSaved().obs;

  static bool get isDarkMode => _isDarkMode.value;

  static ThemeMode getThemeMode() {
    return isDarkModeSaved() ? ThemeMode.dark : ThemeMode.light;
  }

  static bool isDarkModeSaved() {
    return _storage.read(themeKey) ?? false;
  }

  static void saveThemeMode({required bool isDarkMode}) {
    _isDarkMode(isDarkMode);
    _storage.write(themeKey, isDarkMode);
  }

  static void changeThemeMode() {
    Get.changeThemeMode(isDarkModeSaved() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(isDarkMode: !isDarkModeSaved());
  }
}
