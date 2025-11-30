import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../app/widgets/section_header.dart';

class SkillCategory {
  final String title;
  final double value; // 0.0 to 1.0
  final List<String> skills;

  SkillCategory({
    required this.title,
    required this.value,
    required this.skills,
  });
}

final List<SkillCategory> kSkillCategories = [
  SkillCategory(
    title: "Languages",
    value: 1.0,
    skills: ["Python", "SQL", "Flutter"],
  ),
  SkillCategory(
    title: "AI / ML",
    value: 0.9,
    skills: [
      "Scikit-Learn",
      "TensorFlow",
      "XGBoost",
      "MLflow",
      "OpenCV",
      "NeuroKit",     
    ],
  ),
  SkillCategory(
    title: "Agentic / LLM",
    value: 0.9,
    skills: ["LangChain", "LangGraph", "LangSmith", "Opik", "AutoGen", "ADK", "MCP", "RAG",
      "LLMOps",
      "OpenAI API"],
  ),
  SkillCategory(
    title: "Backend & Data",
    value: 0.8,
    skills: [
      "Flask",
      "Streamlit",
      "Pandas",
      "Plotly",
      "BigQuery",
      "REST APIs",
      "Cloud Functions"
    ],
  ),
  SkillCategory(
    title: "DevOps & Cloud",
    value: 0.7,
    skills: ["GCP", "Firebase", "Docker", "Microservices", "CI/CD"],
  ),
  SkillCategory(
    title: "Domain",
    value: 0.6,
    skills: [
      "Clinical Research",
      "EMR/EHR",
      "CPT/RxNorm/ICD",
      "HIPAA",
      "Biomedical Signals"
    ],
  ),
  SkillCategory(
    title: "Soft Skills",
    value: 1.0,
    skills: [
      "Stakeholder Mgmt",
      "Team Leadership",
      "Product Research",
      "Project Coord",
      "Communication"
    ],
  ),
];

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final ScrollController _scrollController = ScrollController();
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start auto-scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double delta = 2; // Speed of scroll

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            currentScroll + delta,
            duration: const Duration(milliseconds: 30),
            curve: Curves.linear,
          );
        }
        _startAutoScroll(); // Recursive call for continuous loop
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : Responsive.screenWidth(context) * 0.1,
        vertical: 80,
      ),
      color: AppColors.secondary, // White background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: const SectionHeader(title: "My Expertise", number: "02"),
          ),
          const SizedBox(height: 60),
          
          // 1. Radar Chart (Centered for both)
          Center(
            child: SizedBox(
              height: isMobile ? 300 : 400,
              width: isMobile ? 300 : 400,
              child: CustomPaint(
                painter: RadarChartPainter(
                  categories: kSkillCategories,
                  lineColor: AppColors.accent,
                  fillColor: AppColors.accent.withOpacity(0.2),
                  textColor: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),

          // 2. Skills Layout (Infinite Auto-Scrolling Carousel)
          SizedBox(
            height: 360, 
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  // Enable mouse drag for web
                  ui.PointerDeviceKind.touch,
                  ui.PointerDeviceKind.mouse,
                },
              ),
              child: ListView.separated(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : Responsive.screenWidth(context) * 0.1),
                scrollDirection: Axis.horizontal,
                // Infinite count
                itemCount: kSkillCategories.length * 1000, 
                separatorBuilder: (context, index) => const SizedBox(width: 30),
                itemBuilder: (context, index) {
                  // Modulo for infinite loop
                  final category = kSkillCategories[index % kSkillCategories.length];
                  return SizedBox(
                    width: 320, 
                    child: SkillCard(category: category),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final SkillCategory category;

  const SkillCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary, // Off-white card
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            category.title,
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: category.skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.secondary, // White chips
                        borderRadius: BorderRadius.circular(30), // Pill shape
                        border: Border.all(
                            color: AppColors.accent.withOpacity(0.1)),
                      ),
                      child: Text(
                        skill,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<SkillCategory> categories;
  final Color lineColor;
  final Color fillColor;
  final Color textColor;

  RadarChartPainter({
    required this.categories,
    required this.lineColor,
    required this.fillColor,
    required this.textColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) * 0.8;
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final axisPaint = Paint()
      ..color = lineColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw concentric polygons (webs)
    for (int i = 1; i <= 4; i++) {
      final r = radius * (i / 4);
      final path = Path();
      for (int j = 0; j < categories.length; j++) {
        final angle = (2 * pi * j) / categories.length - pi / 2;
        final x = center.dx + r * cos(angle);
        final y = center.dy + r * sin(angle);
        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, axisPaint);
    }

    // Draw axes
    for (int j = 0; j < categories.length; j++) {
      final angle = (2 * pi * j) / categories.length - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), axisPaint);

      // Draw labels
      final labelX = center.dx + (radius + 20) * cos(angle);
      final labelY = center.dy + (radius + 20) * sin(angle);
      final textSpan = TextSpan(
        text: categories[j].title,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
      );
    }

    // Draw data polygon
    final path = Path();
    for (int j = 0; j < categories.length; j++) {
      final angle = (2 * pi * j) / categories.length - pi / 2;
      final value = categories[j].value;
      final r = radius * value;
      final x = center.dx + r * cos(angle);
      final y = center.dy + r * sin(angle);
      if (j == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;
      
    for (int j = 0; j < categories.length; j++) {
      final angle = (2 * pi * j) / categories.length - pi / 2;
      final value = categories[j].value;
      final r = radius * value;
      final x = center.dx + r * cos(angle);
      final y = center.dy + r * sin(angle);
      canvas.drawCircle(Offset(x, y), 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
