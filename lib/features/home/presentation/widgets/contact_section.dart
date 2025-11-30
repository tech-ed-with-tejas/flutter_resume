import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:url_launcher/url_launcher.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../../../../core/utils/responsive.dart';
 import '../../../../../app/widgets/app_button.dart';
 
 class ContactSection extends StatelessWidget {
   const ContactSection({super.key});
 
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
         vertical: 100,
       ),
       child: Column(
         children: [
           Text(
             "03. What's Next?",
             style: AppTextStyles.button.copyWith(
               color: AppColors.accent,
               fontSize: 16,
             ),
           ),
           const SizedBox(height: 20),
           Text(
             "Get In Touch",
             style: AppTextStyles.displayMedium.copyWith(
               fontSize: isMobile ? 40 : 50,
             ),
           ),
           const SizedBox(height: 20),
           SizedBox(
             width: isMobile ? double.infinity : 600,
             child: Text(
               "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
               textAlign: TextAlign.center,
               style: AppTextStyles.bodyLarge,
             ),
           ),
           const SizedBox(height: 50),
           AppButton(
             title: "Say Hello",
             isOutline: true,
             onPressed: () => _launchUrl("mailto:tejas2207@yahoo.com"),
           ),
           const SizedBox(height: 100),
           _buildFooter(),
         ],
       ),
     );
   }
 
   Widget _buildFooter() {
     return Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             _socialIcon(FontAwesomeIcons.github, "https://github.com/tech-ed-with-tejas"),
             _socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/tejas-anantharamu/"),
             _socialIcon(FontAwesomeIcons.whatsapp, "https://wa.me/918431703553"),
           ],
         ),
         const SizedBox(height: 20),
         Text(
           "Designed & Built by Tejas A",
           style: AppTextStyles.button.copyWith(
             fontSize: 12,
             color: AppColors.textSecondary,
           ),
         ),
       ],
     );
   }
 
   Widget _socialIcon(IconData icon, String url) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: IconButton(
         icon: FaIcon(icon, color: AppColors.textSecondary, size: 20),
         onPressed: () => _launchUrl(url),
         hoverColor: AppColors.accent,
       ),
     );
   }
 }
