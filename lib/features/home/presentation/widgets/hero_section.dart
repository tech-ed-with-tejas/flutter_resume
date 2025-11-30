import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:url_launcher/url_launcher.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../../../../core/utils/responsive.dart';
 import 'package:get/get.dart';
 import '../../../../../app/widgets/app_button.dart';
 import '../controllers/home_controller.dart';
 import '../../../experience/presentation/views/experience_view.dart';
 
 class HeroSection extends StatelessWidget {
   const HeroSection({super.key});
 
   Future<void> _launchUrl(String url) async {
     final uri = Uri.parse(url);
     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
       throw 'Could not launch $uri';
     }
   }
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     final width = Responsive.screenWidth(context);
 
     return Container(
       padding: EdgeInsets.symmetric(
         horizontal: isMobile ? 20 : width * 0.1,
         vertical: isMobile ? 40 : 80,
       ),
       child: isMobile
           ? Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 _buildProfileImage(width),
                 const SizedBox(height: 30),
                 _buildTextContent(context, isMobile),
               ],
             )
           : Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(child: _buildTextContent(context, isMobile)),
                 _buildProfileImage(width),
               ],
             ),
     );
   }
 
   Widget _buildTextContent(BuildContext context, bool isMobile) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           "Hi, my name is",
           style: AppTextStyles.button.copyWith(
             color: AppColors.accent,
             fontSize: 16,
           ),
         ),
         const SizedBox(height: 10),
         Text(
           "Tejas A.",
           style: AppTextStyles.displayLarge.copyWith(
             fontSize: isMobile ? 32 : 70,
           ),
         ),
         const SizedBox(height: 10),
         Text(
           "Software Development Lead - Agentic AI - Healthcare Tech.",
           style: AppTextStyles.displayMedium.copyWith(
             fontSize: isMobile ? 20 : 60,
             color: AppColors.textSecondary,
           ),
         ),
         const SizedBox(height: 20),
         SizedBox(
           width: isMobile ? double.infinity : 600,
           child: Text(
"Driven technologist with hands-on experience across software engineering, AI & ML, and product development. Currently leading engineering efforts at a healthcare startup, owning delivery from research and data analysis to mobile apps and cloud-ready systems. Experienced in building scalable platforms, integrating healthcare data, managing stakeholders, and translating complex requirements into production-ready solutions.",
             style: AppTextStyles.bodyLarge,
           ),
         ),
         const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              AppButton(
                title: "Contact Me",
                isOutline: false,
                onPressed: () => _launchUrl("mailto:tejas2207@yahoo.com"),
              ),
              AppButton(
                title: "Resume",
                isOutline: true,
                onPressed: () => Get.find<HomeController>().openResume(),
              ),
              AppButton(
                title: "Know More",
                isOutline: true,
                onPressed: () => Get.toNamed(ExperienceView.route),
              ),
            ],
          ),
         const SizedBox(height: 40),
         _buildSocialIcons(),
       ],
     );
   }
 
   Widget _buildProfileImage(double width) {
     // Placeholder for profile image with a decorative frame or shape
     return Center(
       child: Container(
         width: 300,
         height: 300,
         decoration: BoxDecoration(
           color: AppColors.accent.withOpacity(0.1),
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: AppColors.accent),
           image: const DecorationImage(
             image: AssetImage("assets/images/profile.jpeg"),
             fit: BoxFit.cover,
           ),
         ),
       ),
     );
   }
 
   Widget _buildSocialIcons() {
     return Row(
       children: [
         _socialIcon(FontAwesomeIcons.github, "https://github.com/tech-ed-with-tejas"),
         _socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/tejas-anantharamu/"),
         _socialIcon(FontAwesomeIcons.whatsapp, "https://wa.me/918431703553"),
       ],
     );
   }
 
   Widget _socialIcon(IconData icon, String url) {
     return Padding(
       padding: const EdgeInsets.only(right: 20),
       child: IconButton(
         icon: FaIcon(icon, color: AppColors.textSecondary, size: 24),
         onPressed: () => _launchUrl(url),
         hoverColor: AppColors.accent.withOpacity(0.1),
       ),
     );
   }
 }
