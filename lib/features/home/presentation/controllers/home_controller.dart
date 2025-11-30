import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:url_launcher/url_launcher.dart';


class HomeController extends GetxController {
 
  final scrollController = ScrollController();
  RxInt currentIndex = 0.obs;

  final sectionKeys = [
    GlobalKey(), // Home
    GlobalKey(), // Work
    GlobalKey(), // About
    GlobalKey(), // Contact
  ];


 

  void toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> openResume() async {
     const url = 'assets/docs/resume.pdf'; // Correct path
     // For web, we can just launch the asset URL relative to the domain
     // However, typically assets are at assets/docs/resume.pdf
     // Let's try opening it directly.
     final uri = Uri.parse(url);
     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
       // Fallback or error handling
       debugPrint('Could not launch resume');
     }
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