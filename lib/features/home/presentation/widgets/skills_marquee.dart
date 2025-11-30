import 'dart:async';
 import 'package:flutter/material.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 
 class SkillsMarquee extends StatefulWidget {
   final List<String> skills;
 
   const SkillsMarquee({super.key, required this.skills});
 
   @override
   State<SkillsMarquee> createState() => _SkillsMarqueeState();
 }
 
 class _SkillsMarqueeState extends State<SkillsMarquee> {
   late ScrollController _scrollController;
   late Timer _timer;
   double _scrollPosition = 0.0;
 
   @override
   void initState() {
     super.initState();
     _scrollController = ScrollController();
     WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
   }
 
   void _startScrolling() {
     _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
       if (!_scrollController.hasClients) return;
       
       _scrollPosition += 1.0;
       if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
         _scrollPosition = 0.0;
         _scrollController.jumpTo(_scrollPosition);
       } else {
         _scrollController.jumpTo(_scrollPosition);
       }
     });
   }
 
   @override
   void dispose() {
     _timer.cancel();
     _scrollController.dispose();
     super.dispose();
   }
 
   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 60,
       child: ListView.builder(
         controller: _scrollController,
         scrollDirection: Axis.horizontal,
         itemCount: widget.skills.length * 100, // Infinite illusion
         itemBuilder: (context, index) {
           final skill = widget.skills[index % widget.skills.length];
           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: Chip(
               label: Text(
                 skill,
                 style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
               ),
               backgroundColor: AppColors.accent,
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
             ),
           );
         },
       ),
     );
   }
 }
