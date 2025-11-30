import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:url_launcher/url_launcher.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../../../../core/utils/responsive.dart';
 import '../../domain/entities/project_model.dart';
 
 class ProjectCard extends StatefulWidget {
   final ProjectModel project;
 
   const ProjectCard({super.key, required this.project});
 
   @override
   State<ProjectCard> createState() => _ProjectCardState();
 }
 
 class _ProjectCardState extends State<ProjectCard> {
   bool _isHovered = false;
 
   Future<void> _launchUrl(String? url) async {
     if (url == null) return;
     final uri = Uri.parse(url);
     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
       throw 'Could not launch $uri';
     }
   }
 
    List<Widget> _buildTopContent() {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FaIcon(FontAwesomeIcons.folder,
                color: AppColors.accent, size: 40),
            Row(
              children: [
                if (widget.project.githubUrl != null)
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                    onPressed: () => _launchUrl(widget.project.githubUrl),
                    color: AppColors.textSecondary,
                    hoverColor: AppColors.accent,
                  ),
                if (widget.project.demoUrl != null)
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.externalLinkAlt, size: 20),
                    onPressed: () => _launchUrl(widget.project.demoUrl),
                    color: AppColors.textSecondary,
                    hoverColor: AppColors.accent,
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          widget.project.title,
          style: AppTextStyles.headlineMedium.copyWith(fontSize: 22),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Text(
          widget.project.description,
          style: AppTextStyles.bodyMedium,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ];
    }
 
   @override
   Widget build(BuildContext context) {
     final isMobile = Responsive.isMobile(context);
     return MouseRegion(
       onEnter: (_) => setState(() => _isHovered = true),
       onExit: (_) => setState(() => _isHovered = false),
       child: AnimatedContainer(
         duration: const Duration(milliseconds: 200),
         transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
         padding: const EdgeInsets.all(24),
         decoration: BoxDecoration(
           color: AppColors.secondary,
           borderRadius: BorderRadius.circular(8),
           boxShadow: _isHovered
               ? [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.1), // Softer shadow for light mode
                     blurRadius: 20,
                     offset: const Offset(0, 10),
                   )
                 ]
               : [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.05), // Subtle base shadow
                     blurRadius: 10,
                     offset: const Offset(0, 4),
                   )
                 ],
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              isMobile
                   ? Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: _buildTopContent(),
                     )
                   : Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: _buildTopContent(),
                       ),
                     ),
               const SizedBox(height: 24),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Wrap(
                   spacing: 12,
                   runSpacing: 8,
                   children: widget.project.tags
                       .map((tag) => Text(
                             tag,
                             style: AppTextStyles.button.copyWith(fontSize: 12),
                           ))
                       .toList(),
                 ),
                 const SizedBox(height: 20),
                 if (widget.project.demoUrl != null)
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: () => _launchUrl(widget.project.demoUrl),
                       style: OutlinedButton.styleFrom(
                         side: const BorderSide(color: AppColors.accent),
                         padding: const EdgeInsets.symmetric(vertical: 16),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(4),
                         ),
                       ),
                       child: Text(
                         "Try Demo",
                         style: AppTextStyles.button,
                       ),
                     ),
                   ),
               ],
             ),
           ],
         ),
       ),
     );
   }
 }
