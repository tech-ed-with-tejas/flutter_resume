import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tejas_portfolio/app/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/blog_model.dart';
import '../widgets/blog_card.dart';

class BlogsView extends StatelessWidget {
  static const String route = '/blogs';

  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final width = Responsive.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("All Articles", style: AppTextStyles.headlineMedium),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : width * 0.1,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thoughts & Tutorials",
              style: AppTextStyles.displaySmall.copyWith(color: AppColors.accent),
            ),
            const SizedBox(height: 40),
            if (isMobile)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: kBlogs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return BlogCard(blog: kBlogs[index]);
                },
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 3, // 3 columns on desktop for blogs
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: kBlogs.length,
                itemBuilder: (context, index) {
                  return BlogCard(blog: kBlogs[index]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
