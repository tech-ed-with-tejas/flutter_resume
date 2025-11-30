import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 import 'package:get/get.dart';
 import '../../../../core/theme/app_colors.dart';
 import '../../../../core/theme/app_text_styles.dart';
 import '../../../../core/utils/responsive.dart';
 import '../../domain/entities/experience_model.dart';
 import '../widgets/experience_card.dart';
 
import 'package:tejas_portfolio/app/routes/app_routes.dart';

class ExperienceView extends StatefulWidget {
  static const String route = '/experience';

  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _autoScrollTimer;
  bool _isHovering = false;
  bool _isUserScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _stopAutoScroll();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted && !_isHovering && !_isUserScrolling) {
        if (_currentIndex < kExperiences.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  void _nextPage() {
    _stopAutoScroll(); // Pause when manually interacting
    if (_currentIndex < kExperiences.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    _startAutoScroll(); // Restart after interaction
  }

  void _previousPage() {
    _stopAutoScroll(); // Pause when manually interacting
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    _startAutoScroll(); // Restart after interaction
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final width = Responsive.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Experience", style: AppTextStyles.headlineMedium),
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
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : width * 0.1,
              vertical: 20,
            ),
            child: Text(
              "Where I've Worked",
              style: AppTextStyles.displaySmall.copyWith(color: AppColors.accent),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    if (notification.direction == ScrollDirection.idle) {
                      _isUserScrolling = false;
                      Future.delayed(const Duration(seconds: 2), () {
                        if (mounted && !_isUserScrolling && !_isHovering) {
                          _startAutoScroll();
                        }
                      });
                    } else {
                      _isUserScrolling = true;
                      _stopAutoScroll();
                    }
                    return false;
                  },
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() => _isHovering = true);
                      _stopAutoScroll();
                    },
                    onExit: (_) {
                      setState(() => _isHovering = false);
                      _startAutoScroll();
                    },
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: kExperiences.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : width * 0.15,
                            vertical: 20,
                          ),
                          child: ExperienceCard(experience: kExperiences[index]),
                        );
                      },
                    ),
                  ),
                ),
                
                // Navigation Arrows (Desktop/Tablet)
                if (!isMobile) ...[
                  if (_currentIndex > 0)
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: IconButton(
                          onPressed: _previousPage,
                          icon: const Icon(Icons.arrow_back_ios, size: 40),
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  if (_currentIndex < kExperiences.length - 1)
                    Positioned(
                      right: 20,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: IconButton(
                          onPressed: _nextPage,
                          icon: const Icon(Icons.arrow_forward_ios, size: 40),
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),
          
          // Mobile Navigation Controls (Bottom)
          if (isMobile)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _currentIndex > 0 ? _previousPage : null,
                    icon: Icon(
                      Icons.arrow_back_ios, 
                      color: _currentIndex > 0 ? AppColors.accent : Colors.grey.withOpacity(0.3)
                    ),
                  ),
                  Text(
                    "${_currentIndex + 1} / ${kExperiences.length}",
                    style: AppTextStyles.bodyMedium,
                  ),
                  IconButton(
                    onPressed: _currentIndex < kExperiences.length - 1 ? _nextPage : null,
                    icon: Icon(
                      Icons.arrow_forward_ios, 
                      color: _currentIndex < kExperiences.length - 1 ? AppColors.accent : Colors.grey.withOpacity(0.3)
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
