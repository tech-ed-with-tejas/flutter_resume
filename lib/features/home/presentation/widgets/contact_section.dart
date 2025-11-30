import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:url_launcher/url_launcher.dart';
 import '../../../../../core/theme/app_colors.dart';
 import '../../../../../core/theme/app_text_styles.dart';
 import '../../../../../core/utils/responsive.dart';
 import '../../../../../app/widgets/app_button.dart';
 
  class ContactSection extends StatefulWidget {
    const ContactSection({super.key});

    @override
    State<ContactSection> createState() => _ContactSectionState();
  }

  class _ContactSectionState extends State<ContactSection> {
    
    Future<void> _launchEmail({required String subject, required String body}) async {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'tejas2207@yahoo.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': subject,
          'body': body,
        }),
      );

      if (!await launchUrl(emailLaunchUri)) {
        throw 'Could not launch $emailLaunchUri';
      }
    }

    String? _encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    @override
    Widget build(BuildContext context) {
      final isMobile = Responsive.isMobile(context);
      final width = Responsive.screenWidth(context);

      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : width * 0.1,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text(
              "05. What's Next?",
              style: AppTextStyles.button.copyWith(
                color: AppColors.accent,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Get In Touch",
              style: AppTextStyles.displayMedium.copyWith(
                fontSize: isMobile ? 40 : 50,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: isMobile ? double.infinity : 600,
              child: Text(
                "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your visions.",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge,
              ),
            ),
            const SizedBox(height: 50),
            
            // Contact Options
            if (isMobile)
              Column(
                children: [
                  _buildContactCard(
                    icon: FontAwesomeIcons.paperPlane,
                    title: "Get in Touch",
                    description: "Have a question or just want to say hi?",
                    subject: "Hello Tejas!",
                    body: "Hi Tejas,\n\nI just wanted to say hi...",
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    icon: FontAwesomeIcons.handshake,
                    title: "Collaborate",
                    description: "Got an idea? Let's build something amazing together.",
                    subject: "Collaboration Proposal",
                    body: "Hi Tejas,\n\nI have an idea for a collaboration...",
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    icon: FontAwesomeIcons.briefcase,
                    title: "Hire Me",
                    description: "Looking for a developer? Let's discuss your project.",
                    subject: "Job Opportunity",
                    body: "Hi Tejas,\n\nWe have an opening for...",
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildContactCard(
                      icon: FontAwesomeIcons.paperPlane,
                      title: "Get in Touch",
                      description: "Have a question or just want to say hi?",
                      subject: "Hello Tejas!",
                      body: "Hi Tejas,\n\nI just wanted to say hi...",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildContactCard(
                      icon: FontAwesomeIcons.handshake,
                      title: "Collaborate",
                      description: "Got an idea? Let's build something amazing together.",
                      subject: "Collaboration Proposal",
                      body: "Hi Tejas,\n\nI have an idea for a collaboration...",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildContactCard(
                      icon: FontAwesomeIcons.briefcase,
                      title: "Hire Me",
                      description: "Looking for a developer? Let's discuss your project.",
                      subject: "Job Opportunity",
                      body: "Hi Tejas,\n\nWe have an opening for...",
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 100),
            _buildFooter(),
          ],
        ),
      );
    }

    Widget _buildContactCard({
      required IconData icon,
      required String title,
      required String description,
      required String subject,
      required String body,
    }) {
      return _ContactCard(
        icon: icon,
        title: title,
        description: description,
        onTap: () => _launchEmail(subject: subject, body: body),
      );
    }

    Widget _buildFooter() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(FontAwesomeIcons.github, "https://github.com/tech-ed-with-tejas"),
              _socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/tejas-anantharamu/"),
              _socialIcon(FontAwesomeIcons.whatsapp, "https://wa.me/918431703553"),
            ],
          ),
          const SizedBox(height: 20),
           Text(
             "Designed & Built by Tejas A ",
             style: AppTextStyles.button.copyWith(
               fontSize: 12,
               color: AppColors.textSecondary,
             ),
           ),
           const SizedBox(height: 5),
           Text(
             "Credit- Antigravity",
             style: AppTextStyles.button.copyWith(
               fontSize: 12,
               color: AppColors.textSecondary,
             ),
           ),
        ],
      );
    }
  
    Widget _socialIcon(IconData icon, String url) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          icon: FaIcon(icon, color: AppColors.textSecondary, size: 20),
          onPressed: () async {
             final uri = Uri.parse(url);
             if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
               throw 'Could not launch $uri';
             }
          },
          hoverColor: AppColors.accent,
        ),
      );
    }
  }

  class _ContactCard extends StatefulWidget {
    final IconData icon;
    final String title;
    final String description;
    final VoidCallback onTap;

    const _ContactCard({
      required this.icon,
      required this.title,
      required this.description,
      required this.onTap,
    });

    @override
    State<_ContactCard> createState() => _ContactCardState();
  }

  class _ContactCardState extends State<_ContactCard> {
    bool _isHovered = false;

    @override
    Widget build(BuildContext context) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
            height: 280, // Fixed height for uniformity
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered ? AppColors.accent : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: FaIcon(
                    widget.icon,
                    color: AppColors.accent,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: AppTextStyles.headlineMedium.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
