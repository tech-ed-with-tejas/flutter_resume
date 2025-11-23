import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
 
  final scrollController = ScrollController();
  RxInt currentIndex = 0.obs;

  final sectionKeys = [
    GlobalKey(), // Home
    GlobalKey(), // Work
    GlobalKey(), // About
  ];


 

  void toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  void openResume() {
    // open resume action
  }

  void openProjects() {
    // navigate to projects
  }

  void scrollToSection(int index) {
    currentIndex.value = index;

    final ctx = sectionKeys[index].currentContext;
    if (ctx == null) return;

    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }




}