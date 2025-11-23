import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tejas_portfolio/app/widgets/app_bar.dart';
import 'package:tejas_portfolio/app/widgets/app_drawer_mobile.dart';
import 'package:tejas_portfolio/app/widgets/first_box.dart';
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
      title: Row(children: [const Icon(
        Icons.construction,
        color: Colors.green,
        size: 24,
      ),
       SizedBox(width: width*0.01),
  
      /// NAME
      Text(
        "Build with Tejas",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),],),
        // actions: isMobile ? [ThemeToggleButton()] : []

    ): MyAppBar(),
    endDrawer: isMobile ?AppDrawerMobile(): null,
    body: SingleChildScrollView(
      child: Column(
      children: [
          Container(
        key: controller.sectionKeys[0],
        child: ProfileBox(),
      ),

      // SECTION 1 — WORK
      Container(
        key: controller.sectionKeys[1],
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: const Text("Work Section", style: TextStyle(fontSize: 24)),
      ),

      // SECTION 2 — ABOUT
      Container(
        key: controller.sectionKeys[2],
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: const Text("About Section", style: TextStyle(fontSize: 24)),
      ),
      ],// remove last spacer
      ),
    )
    );
  }
}
