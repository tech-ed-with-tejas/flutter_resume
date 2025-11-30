import 'package:flutter/material.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../domain/entities/experience_model.dart';
 
 class ExperienceCard extends StatelessWidget {
   final ExperienceModel experience;
 
   const ExperienceCard({super.key, required this.experience});
 
   @override
   Widget build(BuildContext context) {
     return Container(
       margin: const EdgeInsets.only(bottom: 30),
       padding: const EdgeInsets.all(24),
       decoration: BoxDecoration(
         color: AppColors.secondary,
         borderRadius: BorderRadius.circular(8),
         border: Border.all(color: AppColors.primary), // Subtle border
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.05),
             blurRadius: 10,
             offset: const Offset(0, 4),
           )
         ],
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(
                 child: Text(
                   experience.role,
                   style: AppTextStyles.headlineMedium.copyWith(
                     color: AppColors.textPrimary,
                     fontSize: 20,
                   ),
                 ),
               ),
               Text(
                 experience.duration,
                 style: AppTextStyles.button.copyWith(color: AppColors.accent),
               ),
             ],
           ),
           const SizedBox(height: 8),
           Text(
             experience.company,
             style: AppTextStyles.bodyLarge.copyWith(
               color: AppColors.accent,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 16),
           Text(
             experience.description,
             style: AppTextStyles.bodyMedium,
           ),
           const SizedBox(height: 20),
           Wrap(
             spacing: 10,
             runSpacing: 8,
             children: experience.technologies
                 .map((tech) => Container(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 12, vertical: 6),
                       decoration: BoxDecoration(
                         color: AppColors.primary, // Off-white chips
                         borderRadius: BorderRadius.circular(20), // Pill shape
                         border: Border.all(
                             color: AppColors.accent.withOpacity(0.1)),
                       ),
                       child: Text(
                         tech,
                         style: AppTextStyles.bodyMedium.copyWith(
                           fontSize: 12,
                           color: AppColors.textPrimary,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ))
                 .toList(),
           ),
         ],
       ),
     );
   }
 }
