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

   Widget _buildProjectImage(String path) {
     if (path.startsWith('http')) {
       return Image.network(
         path,
         fit: BoxFit.cover,
         errorBuilder: (context, error, stackTrace) =>
             Container(color: AppColors.primary),
       );
     }
     return Image.asset(
       path,
       fit: BoxFit.cover,
       errorBuilder: (context, error, stackTrace) =>
           Container(color: AppColors.primary),
     );
   }
 

 
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0), // Reduced hover lift
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12), // Slightly smaller radius
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Project Image (Compact)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 120, // Reduced height further
                width: double.infinity,
                child: (widget.project.projectImage != null || widget.project.imageUrl != null)
                    ? _buildProjectImage(widget.project.projectImage ?? widget.project.imageUrl!)
                    : Container(
                        color: AppColors.primary,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.code,
                            color: AppColors.accent.withOpacity(0.5),
                            size: 28, // Smaller icon
                          ),
                        ),
                      ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(12), // Reduced padding further
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Title and GitHub Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.project.title,
                          style: AppTextStyles.headlineMedium.copyWith(fontSize: 16), // Smaller font
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.project.githubUrl != null)
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                          onPressed: () => _launchUrl(widget.project.githubUrl),
                          color: AppColors.textPrimary,
                          tooltip: "View on GitHub",
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6), // Reduced spacing

                  // Description
                  Text(
                    widget.project.description,
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12), // Reduced spacing

                  // 3. Tech Stack (Scrollable)
                  SizedBox(
                    height: 24, // Compact height
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.project.tags.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 6),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.accent.withOpacity(0.1)),
                          ),
                          child: Text(
                            widget.project.tags[index],
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 10, // Smaller font
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // 4. Try Demo Button (Conditional)
                  if (widget.project.demoUrl != null) ...[
                    const SizedBox(height: 12), // Reduced spacing
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchUrl(widget.project.demoUrl),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.accent),
                          padding: const EdgeInsets.symmetric(vertical: 10), // Reduced padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: AppColors.accent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Try Demo", style: TextStyle(fontSize: 12)),
                            const SizedBox(width: 6),
                            const FaIcon(FontAwesomeIcons.externalLinkAlt, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
