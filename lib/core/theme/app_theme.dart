import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  // Minimalist Light Theme (Primary)
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        cardColor: AppColors.secondary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.accent,
          secondary: AppColors.secondary,
          background: AppColors.primary,
          surface: AppColors.secondary,
          onPrimary: Colors.white,
          onSecondary: AppColors.textPrimary,
          onBackground: AppColors.textPrimary,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.textPrimary),
          displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.textPrimary),
          displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.textPrimary),
          headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.textPrimary),
          bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
          bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          labelLarge: AppTextStyles.button.copyWith(color: AppColors.accent),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary, // Transparent/Same as bg
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
      );

  // Dark Theme (Inverted Minimalist)
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF000000),
        scaffoldBackgroundColor: const Color(0xFF000000),
        cardColor: const Color(0xFF1C1C1E),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: Color(0xFF1C1C1E),
          background: Color(0xFF000000),
          surface: Color(0xFF1C1C1E),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyles.displayLarge.copyWith(color: Colors.white),
          displayMedium: AppTextStyles.displayMedium.copyWith(color: Colors.white),
          displaySmall: AppTextStyles.displaySmall.copyWith(color: Colors.white),
          headlineMedium: AppTextStyles.headlineMedium.copyWith(color: Colors.white),
          bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Color(0xFF86868B)),
          bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Color(0xFF86868B)),
          labelLarge: AppTextStyles.button.copyWith(color: AppColors.accent),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
}