import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import '../../core/theme/app_colors.dart';
 import '../../core/theme/app_text_styles.dart';
 import '../../features/home/presentation/controllers/home_controller.dart';
 import 'app_button.dart';
 
 class AppDrawerMobile extends StatelessWidget {
   const AppDrawerMobile({super.key});
 
   @override
   Widget build(BuildContext context) {
     final homeController = Get.find<HomeController>();
 
     return Drawer(
       backgroundColor: AppColors.primary,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.all(20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 IconButton(
                   icon: const Icon(Icons.close, color: AppColors.textPrimary),
                   onPressed: () => Get.back(),
                 ),
               ],
             ),
           ),
           const SizedBox(height: 20),
           _DrawerItem(
             title: "Home",
             onTap: () {
               Get.back();
               homeController.scrollToSection(0);
             },
           ),
           _DrawerItem(
             title: "Work",
             onTap: () {
               Get.back();
               homeController.scrollToSection(1);
             },
           ),
           _DrawerItem(
             title: "About",
             onTap: () {
               Get.back();
               homeController.scrollToSection(2);
             },
           ),
           _DrawerItem(
             title: "Contact",
             onTap: () {
               Get.back();
               homeController.scrollToSection(3);
             },
           ),
           const Spacer(),
           Padding(
             padding: const EdgeInsets.all(20),
             child: AppButton(
               title: "Resume",
               isOutline: true,
               onPressed: () {
                 Get.back();
                 homeController.openResume();
               },
             ),
           ),
           const SizedBox(height: 40),
         ],
       ),
     );
   }
 }
 
 class _DrawerItem extends StatelessWidget {
   final String title;
   final VoidCallback onTap;
 
   const _DrawerItem({
     required this.title,
     required this.onTap,
   });
 
   @override
   Widget build(BuildContext context) {
     return ListTile(
       title: Text(
         title,
         style: AppTextStyles.headlineMedium.copyWith(
           fontSize: 24,
           color: AppColors.textPrimary,
         ),
       ),
       onTap: onTap,
       contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
     );
   }
 }