import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  var isDarkMode = false.obs;

  //* Storage

  final _getStorage = GetStorage();
  final _storageKey = "isDarkMode";

  bool isSavedDarkMode() {
    var response = _getStorage.read(_storageKey) ?? false;
    isDarkMode.value = response;
    return response;
  }

  void saveThemeMode(bool isDark) {
    _getStorage.write(_storageKey, isDark);
    isDarkMode.value = isDark;
  }

  toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
}
