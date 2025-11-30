import 'package:flutter/material.dart';
 import '../../core/theme/app_colors.dart';
 import '../../core/theme/app_text_styles.dart';
 
 class AppButton extends StatefulWidget {
   final String title;
   final VoidCallback onPressed;
   final bool isOutline;
 
   const AppButton({
     super.key,
     required this.title,
     required this.onPressed,
     this.isOutline = true,
   });
 
   @override
   State<AppButton> createState() => _AppButtonState();
 }
 
 class _AppButtonState extends State<AppButton> {
   bool _isHovered = false;
 
   @override
   Widget build(BuildContext context) {
     return MouseRegion(
       onEnter: (_) => setState(() => _isHovered = true),
       onExit: (_) => setState(() => _isHovered = false),
       cursor: SystemMouseCursors.click,
       child: GestureDetector(
         onTap: widget.onPressed,
         child: AnimatedContainer(
           duration: const Duration(milliseconds: 200),
           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
           decoration: BoxDecoration(
             color: widget.isOutline
                 ? (_isHovered ? AppColors.accent.withOpacity(0.1) : Colors.transparent)
                 : AppColors.accent,
             border: Border.all(color: AppColors.accent),
             borderRadius: BorderRadius.circular(4),
             boxShadow: _isHovered && !widget.isOutline
                 ? [
                     BoxShadow(
                       color: AppColors.accent.withOpacity(0.4),
                       blurRadius: 10,
                       offset: const Offset(0, 4),
                     )
                   ]
                 : [],
           ),
           child: Text(
             widget.title,
             style: AppTextStyles.button.copyWith(
               color: widget.isOutline ? AppColors.accent : AppColors.primary,
             ),
           ),
         ),
       ),
     );
   }
 }
