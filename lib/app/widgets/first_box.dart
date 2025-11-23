import 'package:flutter/material.dart';
import 'package:tejas_portfolio/core/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = Responsive.screenWidth(context);
    final height = Responsive.screenHeight(context);
    final isMobile = Responsive.isMobile(context);
    final istablet = Responsive.isTablet(context);


    // return const Column();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ?  istablet ? width * 0.1 :width*0.1 : width*0.25, vertical: height * 0.02),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(height: height * 0.004),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, -10 * (1 - value)), // Moves up slightly
                  child: Opacity(
                    opacity: value,
                    child: CircleAvatar(
                      radius: isMobile ? width *0.2 : width * 0.07,
                      backgroundImage: AssetImage("assets/images/profile.jpeg"),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: height * 0.04),

            SizedBox(
              width: isMobile
                  ? double.infinity
                  : width * 0.60, // tighter on big screens
              child: Text(
                "Hi, I'm Tejas, an independent consultant and AI enthusiast & educator.",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile
                      ? 20 // mobile size
                      : (theme.textTheme.headlineLarge?.fontSize ?? 30) * 1.2,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),

            SizedBox(
              child: Text(
                "Tech-savvy software engineer and AI team lead with a strong foundation in machine learning, biomedical data analysis, and full-stack development. Currently leading AI and product development in healthtech startup. Seeking to advance intelligent agent-based systems to solve real-world problems and drive impactful AI innovations.",
              ),
            ),

            // SOCIAL ICONS ROW

            SizedBox(height: height * 0.03),

            Center(
              child: Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  // LinkedIn
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                    ), // replace with custom icon
                    iconSize: 32,
                    onPressed: () =>
                        _launchUrl("https://www.linkedin.com/in/tejas-anantharamu/"),
                  ),

                  // GitHub
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    iconSize: 32,
                    onPressed: () =>
                        _launchUrl("https://github.com/tech-ed-with-tejas"),
                  ),

                  // Email
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.envelope),
                    iconSize: 32,
                    onPressed: () => _launchUrl("mailto:tejas2207@yahoo.com"),
                  ),

                  // WhatsApp
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    color: Colors.green,
                    iconSize: 32,
                    onPressed: () => _launchUrl(
                      "https://wa.me/918431703553",
                    ), // e.g. wa.me/919876543210
                  ),
                ],
              ),
            ),

            //  Padding(
            //     padding:  EdgeInsets.symmetric(horizontal: width *0.06),
            //     child: Center(child: Text("Tech-savvy software engineer and AI team lead with a strong foundation in machine learning, biomedical data analysis, and full-stack development. Currently leading AI and product development in healthtech startup. Seeking to advance intelligent agent-based systems to solve real-world problems and drive impactful AI innovations.")),
            //   ),
          ],
        ),
      ),
    );
  }
}
