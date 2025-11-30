import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import '../core/theme/app_theme.dart';
import 'controllers/theme_controller.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Tejas A',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Force Light Mode for Minimalist Theme
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}