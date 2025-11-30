import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../features/home/presentation/controllers/home_controller.dart';
import 'app_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Responsive.screenWidth(context);
    final homeController = Get.find<HomeController>();

    return AppBar(
      backgroundColor: AppColors.primary.withOpacity(0.9),
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Row(
          children: [
            Text(
              "< T / >",
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Obx(() {
          return Row(
            children: [
              _NavItem(
                title: "Home",
                isActive: homeController.currentIndex.value == 0,
                index: 0,
                onTap: homeController.scrollToSection,
              ),
              _NavItem(
                title: "Work",
                isActive: homeController.currentIndex.value == 1,
                index: 1,
                onTap: homeController.scrollToSection,
              ),
              _NavItem(
                title: "About",
                isActive: homeController.currentIndex.value == 2,
                index: 2,
                onTap: homeController.scrollToSection,
              ),
              _NavItem(
                title: "Contact",
                isActive: homeController.currentIndex.value == 3,
                index: 3,
                onTap: homeController.scrollToSection,
              ),
            ],
          );
        }),
        const SizedBox(width: 20),
        Padding(
          padding: EdgeInsets.only(right: width * 0.05),
          child: AppButton(
            title: "Resume",
            isOutline: true,
            onPressed: homeController.openResume,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final int index;
  final Function(int) onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isActive ? AppColors.accent : AppColors.textPrimary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isActive ? 20 : 0,
              color: AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
