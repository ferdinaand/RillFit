import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riilfit/src/presentation/themes/dark.theme.dart';
import 'package:riilfit/src/presentation/themes/light.theme.dart';

abstract class IThemeService {
  ThemeMode getThemeMode();
  bool isDarkModeSaved();
  void saveThemeMode({required bool isDarkMode});
  void changeThemeMode();
}

class ThemeService extends GetxService implements IThemeService {
  @override
  void onInit() {
    _storage = GetStorage();
    _isDarkMode(isDarkModeSaved());
    super.onInit();
  }

  final light = lightTheme;
  final dark = darkTheme;

  late GetStorage _storage;
  static const themeKey = 'isDarkMode';

  final _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;

  @override
  ThemeMode getThemeMode() {
    return isDarkModeSaved() ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  bool isDarkModeSaved() {
    return _storage.read(themeKey) ?? false;
  }

  @override
  void saveThemeMode({required bool isDarkMode}) {
    _isDarkMode(isDarkMode);
    _storage.write(themeKey, isDarkMode);
  }

  @override
  void changeThemeMode() {
    Get.changeThemeMode(isDarkModeSaved() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(isDarkMode: !isDarkModeSaved());
  }
}
