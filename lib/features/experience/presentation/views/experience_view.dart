import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import '../../../../core/theme/app_colors.dart';
 import '../../../../core/theme/app_text_styles.dart';
 import '../../../../core/utils/responsive.dart';
 import '../../domain/entities/experience_model.dart';
 import '../widgets/experience_card.dart';
 
 class ExperienceView extends StatelessWidget {
   static const String route = '/experience';
 
   const ExperienceView({super.key});
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     final width = Responsive.screenWidth(context);
 
     return Scaffold(
       appBar: AppBar(
         title: Text("Experience", style: AppTextStyles.headlineMedium),
         leading: IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () => Get.back(),
         ),
         backgroundColor: AppColors.primary,
         elevation: 0,
       ),
       body: SingleChildScrollView(
         padding: EdgeInsets.symmetric(
           horizontal: isMobile ? 20 : width * 0.2, // Centered with more padding on desktop
           vertical: 40,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "Where I've Worked",
               style: AppTextStyles.displaySmall.copyWith(color: AppColors.accent),
             ),
             const SizedBox(height: 40),
             ListView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: kExperiences.length,
               itemBuilder: (context, index) {
                 return ExperienceCard(experience: kExperiences[index]);
               },
             ),
           ],
         ),
       ),
     );
   }
 }
