import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../app/widgets/section_header.dart';
import '../../../../../app/widgets/app_button.dart';
import '../../domain/entities/blog_model.dart';
import '../views/blogs_view.dart';
import 'blog_card.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final width = Responsive.screenWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : width * 0.1,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "My Articles", number: "04"),
          const SizedBox(height: 40),
          if (isMobile)
            Column(
              children: kBlogs
                  .take(2)
                  .map((blog) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: BlogCard(blog: blog),
                      ))
                  .toList(),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.0, // Reduced height
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemCount: kBlogs.take(2).length,
              itemBuilder: (context, index) {
                return BlogCard(blog: kBlogs[index]);
              },
            ),
          const SizedBox(height: 60),
          Center(
            child: AppButton(
              title: "Read More Articles",
              onPressed: () => Get.toNamed(BlogsView.route),
            ),
          ),
        ],
      ),
    );
  }
}
