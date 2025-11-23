import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tejas_portfolio/app/controllers/theme_controller.dart';
import 'package:tejas_portfolio/app/widgets/theme_toggle_button.dart';
import 'package:tejas_portfolio/core/utils/responsive.dart';
import 'package:tejas_portfolio/features/home/presentation/controllers/home_controller.dart';

class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // final hight = Responsive.screenHeight(context);
    final width = Responsive.screenWidth(context);
    final themeController = Get.find<HomeController>();
    return Drawer(
  width: width, // makes it look like a modern sidebar
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // const SizedBox(height: 60),

      Padding(
        padding:  EdgeInsets.all(width *0.03),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          IconButton(
  icon: Icon(Icons.close),
  onPressed: () {
     Navigator.pop(context);
  },
)
        ],),
      ),

      // Profile section
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const CircleAvatar(
      //         radius: 35,
      //         backgroundImage: AssetImage("assets/images/profile.jpeg"),
      //       ),
      //       const SizedBox(height: 10),
      //       Text(
      //         "Tejas",
      //         style: Theme.of(context).textTheme.titleMedium?.copyWith(
      //               fontWeight: FontWeight.bold,
      //             ),
      //       ),
      //       const SizedBox(height: 20),
      //     ],
      //   ),
      // ),

      // const Divider(),

      // Navigation menu
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _drawerItem(
              icon: Icons.home,
              label: "Home",
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.person,
              label: "About",
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.work,
              label: "Projects",
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.contact_mail,
              label: "Contact",
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.dark_mode,
              label: "Theme",
              onTap: () {
                themeController.toggleTheme();
                Navigator.pop(context);},
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}

Widget _drawerItem({
  required IconData icon,
  required String label,
  required Function() onTap,
}) {
  return ListTile(
    horizontalTitleGap: 12,
    leading: Icon(icon),
    title: Text(label),
    onTap: onTap,
  );
}