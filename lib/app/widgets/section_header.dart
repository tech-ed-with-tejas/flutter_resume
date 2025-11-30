import 'package:flutter/material.dart';
 import '../../core/theme/app_colors.dart';
 import '../../core/theme/app_text_styles.dart';
 import '../../core/utils/responsive.dart';
 
 class SectionHeader extends StatelessWidget {
   final String title;
   final String number;
 
   const SectionHeader({
     super.key,
     required this.title,
     required this.number,
   });
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
 
     return Row(
       children: [
         Text(
           "$number. ",
           style: AppTextStyles.headlineMedium.copyWith(
             color: AppColors.accent,
             fontFamily: 'FiraCode', // Monospace look for numbers
             fontSize: isMobile ? 20 : 24,
           ),
         ),
         Text(
           title,
           style: AppTextStyles.headlineMedium.copyWith(
             color: AppColors.textPrimary,
             fontSize: isMobile ? 22 : 26,
           ),
         ),
         const SizedBox(width: 20),
         Expanded(
           child: Container(
             height: 1,
             color: AppColors.secondary,
           ),
         ),
       ],
     );
   }
 }
