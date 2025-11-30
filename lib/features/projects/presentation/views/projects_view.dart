import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/domain/entities/project_model.dart';
import '../../../home/presentation/widgets/project_card.dart';
 
import 'package:tejas_portfolio/app/routes/app_routes.dart';

 class ProjectsView extends StatelessWidget {
   static const String route = '/projects';
 
   const ProjectsView({super.key});
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     final isTablet = Responsive.isTablet(context);
     final width = Responsive.screenWidth(context);
 
     return Scaffold(
       appBar: AppBar(
         title: Text("All Projects", style: AppTextStyles.headlineMedium),
         leading: IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () {
             if (Navigator.canPop(context)) {
               Get.back();
             } else {
               Get.offAllNamed(Routes.HOME);
             }
           },
         ),
       ),
       body: SingleChildScrollView(
         padding: EdgeInsets.symmetric(
           horizontal: isMobile ? 20 : width * 0.1,
           vertical: 40,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "A big list of things I've worked on",
               style: AppTextStyles.displaySmall.copyWith(color: AppColors.accent),
             ),
             const SizedBox(height: 40),
              if (isMobile)
                 ListView.separated(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: kProjects.length,
                   separatorBuilder: (context, index) => const SizedBox(height: 20),
                   itemBuilder: (context, index) {
                     return ProjectCard(project: kProjects[index]);
                   },
                 )
               else
                 GridView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: isTablet ? 2 : 3,
                     childAspectRatio: 1.1, // Increased to reduce height and white space
                     crossAxisSpacing: 20,
                     mainAxisSpacing: 20,
                   ),
                   itemCount: kProjects.length,
                   itemBuilder: (context, index) {
                     return ProjectCard(project: kProjects[index]);
                   },
                 ),
           ],
         ),
       ),
     );
   }
 }
