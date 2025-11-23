import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:tejas_portfolio/app/widgets/theme_toggle_button.dart';
import 'package:tejas_portfolio/core/utils/responsive.dart';
import 'package:tejas_portfolio/features/home/presentation/controllers/home_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Responsive.screenWidth(context);
    final themeController = Get.find<HomeController>();
    final currentIndex = themeController.currentIndex.value;

    return AppBar(
      // elevation: 6,
      // shadowColor: const Color.fromARGB(255, 65, 62, 62).withValues(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(width: width * 0.2),

          /// ICON
          const Icon(Icons.construction, color: Colors.green, size: 24),
          SizedBox(width: width * 0.01),

          /// NAME
          Text(
            "Build with Tejas",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),

      actions: [
        Obx(() {
          return Row(
            children: [
              _NavItem(
                title: "Home",
                isActive: themeController.currentIndex.value == 0,
                index: 0,
                onTap: themeController.scrollToSection,
              ),
              _NavItem(
                title: "Work",
                isActive: themeController.currentIndex.value == 1,
                index: 1,
                onTap: themeController.scrollToSection,
              ),
              _NavItem(
                title: "About",
                isActive: themeController.currentIndex.value == 2,
                index: 2,
                onTap: themeController.scrollToSection,
              ),
            ],
          );
        }),

        SizedBox(width: width * 0.01),

        /// CONNECT BUTTON
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {},
            child: const Text("Connect", style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(width: width * 0.2),

        IconButton(
          icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: themeController.toggleTheme,
          tooltip: Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => onTap(index), // ⭐ scrolls to correct section
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isActive
                    ? Colors.green.shade700
                    : theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            if (isActive)
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
