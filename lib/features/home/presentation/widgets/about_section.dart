import 'package:flutter/material.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../../../../core/utils/responsive.dart';
 import '../../../../../app/widgets/section_header.dart';
 import 'skills_marquee.dart';
 
 class AboutSection extends StatelessWidget {
   const AboutSection({super.key});
 
   static const List<String> _skills = [
     "Flutter", "Dart", "Python", "TensorFlow", "FastAPI", 
     "React", "Node.js", "Firebase", "AWS", "Docker", 
     "Git", "CI/CD", "Agile", "UI/UX Design"
   ];
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     final width = Responsive.screenWidth(context);
 
     return Container(
       padding: EdgeInsets.symmetric(
         horizontal: isMobile ? 20 : width * 0.1,
         vertical: 60,
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SectionHeader(title: "About Me", number: "02"),
           const SizedBox(height: 40),
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(
                 flex: 3,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       """Over the past few years, I’ve grown from an AI/ML engineer into a software development lead in healthcare. I’ve built multiple machine learning models end to end especially for clinical use cases, from collecting and cleaning data, to training and validating models, to deploying them into production systems.

More recently, I’ve led the development of a clinical platform used by 1000+ users across U.S. clinics and providers, moving beyond models into full product engineering. I’ve helped design the product, manage the website and integrations, coordinate a cross-functional team, and maintain ongoing communication with stakeholders so the platform actually fits real-world clinical workflows""",
                       style: AppTextStyles.bodyLarge,
                     ),
                     const SizedBox(height: 20),
                   
                   ],
                 ),
               ),
               if (!isMobile) ...[
                 const SizedBox(width: 40),
                 Expanded(
                   flex: 2,
                   child: Container(
                     height: 300,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: const DecorationImage(
                         image: AssetImage("assets/images/profile.jpeg"),
                          // Reuse or different image
                       ),
                     ),
                   ),
                 ),
               ],
             ],
           ),
           const SizedBox(height: 60),
           Text(
             "Here are a few technologies I've been working with recently:",
             style: AppTextStyles.bodyMedium.copyWith(color: AppColors.accent),
           ),
           const SizedBox(height: 20),
           // SkillsMarquee removed in favor of SkillsSection
           // Reverse direction or different set could be added here for more "chaos"
         ],
       ),
     );
   }
 }
