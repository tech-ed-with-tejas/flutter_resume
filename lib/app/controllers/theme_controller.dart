import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String _themeKey = 'isDarkMode';
  
  final Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  late SharedPreferences _prefs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    _loadThemePreference();
  }

  void _loadThemePreference() {
    final isDark = _prefs.getBool(_themeKey) ?? false; // Dark mode is default
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final isDark = themeMode.value == ThemeMode.dark;
    themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;
    _prefs.setBool(_themeKey, !isDark);
  }

  bool get isDarkMode => themeMode.value == ThemeMode.dark;
}
