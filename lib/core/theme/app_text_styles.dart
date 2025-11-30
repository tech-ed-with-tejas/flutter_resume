import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
 import 'app_colors.dart';
 
 class AppTextStyles {
   static TextStyle get displayLarge => GoogleFonts.poppins(
         fontSize: 56,
         fontWeight: FontWeight.bold,
         color: AppColors.textPrimary,
         height: 1.1,
       );
 
   static TextStyle get displayMedium => GoogleFonts.poppins(
         fontSize: 40,
         fontWeight: FontWeight.bold,
         color: AppColors.textPrimary,
         height: 1.2,
       );
 
   static TextStyle get displaySmall => GoogleFonts.poppins(
         fontSize: 32,
         fontWeight: FontWeight.w600,
         color: AppColors.textPrimary,
         height: 1.2,
       );
 
   static TextStyle get headlineMedium => GoogleFonts.poppins(
         fontSize: 24,
         fontWeight: FontWeight.w600,
         color: AppColors.textPrimary,
         height: 1.3,
       );
 
   static TextStyle get bodyLarge => GoogleFonts.inter(
         fontSize: 18,
         fontWeight: FontWeight.normal,
         color: AppColors.textSecondary,
         height: 1.5,
       );
 
   static TextStyle get bodyMedium => GoogleFonts.inter(
         fontSize: 16,
         fontWeight: FontWeight.normal,
         color: AppColors.textSecondary,
         height: 1.5,
       );
 
   static TextStyle get button => GoogleFonts.firaCode(
         fontSize: 14,
         fontWeight: FontWeight.w500,
         color: AppColors.accent,
         letterSpacing: 1.0,
       );
 }
