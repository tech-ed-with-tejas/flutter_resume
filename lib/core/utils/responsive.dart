import 'package:flutter/material.dart';

class Responsive {
  const Responsive._();

  // Screen width helpers
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context) =>
      screenWidth(context) < 600;

  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1100;

  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= 1100;

  // Widget builder which picks based on screen width
  static Widget layout({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  // Example: number of grid columns based on width using LayoutBuilder
  static int gridColumnCount(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    if (width >= 1400) return 4;
    if (width >= 1100) return 3;
    if (width >= 800) return 2;
    return 1;
  }
}