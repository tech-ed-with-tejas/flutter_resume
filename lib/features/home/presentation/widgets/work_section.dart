import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/utils/responsive.dart';
 import '../../../../../app/widgets/section_header.dart';
 import '../../../../../app/widgets/app_button.dart';
 import '../../domain/entities/project_model.dart';
 import 'project_card.dart';
 import '../../../projects/presentation/views/projects_view.dart';
 
 class WorkSection extends StatelessWidget {
   const WorkSection({super.key});
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     final isTablet = Responsive.isTablet(context);
     final width = Responsive.screenWidth(context);
 
     return Container(
       padding: EdgeInsets.symmetric(
         horizontal: isMobile ? 20 : width * 0.1,
         vertical: 60,
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SectionHeader(title: "Some Things I've Built", number: "01"),
           const SizedBox(height: 40),
           if (isMobile)
             Column(
               children: kProjects
                   .take(4)
                   .map((project) => Padding(
                         padding: const EdgeInsets.only(bottom: 20),
                         child: ProjectCard(project: project),
                       ))
                   .toList(),
             )
           else
             GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: isTablet ? 2 : 3,
                 childAspectRatio: 0.6,
                 crossAxisSpacing: 20,
                 mainAxisSpacing: 20,
               ),
               itemCount: kProjects.take(4).length,
               itemBuilder: (context, index) {
                 return ProjectCard(project: kProjects[index]);
               },
             ),
           const SizedBox(height: 60),
           Center(
             child: AppButton(
               title: "View All Projects",
               onPressed: () => Get.toNamed(ProjectsView.route),
             ),
           ),
         ],
       ),
     );
   }
 }
