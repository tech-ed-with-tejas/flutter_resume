import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => IconButton(
        icon: Icon(
          themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        ),
        onPressed: themeController.toggleTheme,
        tooltip: themeController.isDarkMode ? 'Light Mode' : 'Dark Mode',
      ),
    );
  }
}
