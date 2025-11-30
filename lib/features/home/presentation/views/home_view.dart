import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import '../../../../core/theme/app_colors.dart';
 import '../../../../core/theme/app_text_styles.dart';
import 'package:tejas_portfolio/app/widgets/app_bar.dart';
import 'package:tejas_portfolio/app/widgets/app_drawer_mobile.dart';
import 'package:tejas_portfolio/app/widgets/first_box.dart';
 import '../widgets/hero_section.dart';
 import '../widgets/skills_section.dart'; // Added this import
 import '../widgets/work_section.dart';
 import '../widgets/about_section.dart';
 import '../widgets/contact_section.dart';
 import '../controllers/home_controller.dart';
import '../../../../core/utils/responsive.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    final width = Responsive.screenWidth(context);

    return Scaffold(

    appBar: isMobile ? AppBar(
       backgroundColor: AppColors.primary,
       elevation: 0,
       title: Text(
         "< T / >",
         style: AppTextStyles.headlineMedium.copyWith(
           color: AppColors.accent,
           fontWeight: FontWeight.bold,
         ),
       ),
       iconTheme: const IconThemeData(color: AppColors.accent),
     ): const MyAppBar(),
    endDrawer: isMobile ?AppDrawerMobile(): null,
    body: SingleChildScrollView(
      child: Column(
      children: [
          Container(
        key: controller.sectionKeys[0],
        child: const HeroSection(),
      ),

      // SECTION 1 — WORK
       Container(
         key: controller.sectionKeys[1],
         child: const WorkSection(),
       ),

      // SECTION 2 — ABOUT
       Container(
         key: controller.sectionKeys[2],
         child: const AboutSection(),
       ),

       // SECTION 2.5 — SKILLS
       const SkillsSection(),
 
       // SECTION 3 — CONTACT
       Container(
         key: controller.sectionKeys[3],
         child: const ContactSection(),
       ),
       ],// remove last spacer
      ),
    )
    );
  }
}
