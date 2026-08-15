import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../hero/hero_section.dart';

class FooterSection extends StatelessWidget {
  final Function(int) onNavItemTap;

  const FooterSection({
    super.key,
    required this.onNavItemTap,
  });

  static const List<String> navItems = [
    'Home',
    'About',
    'Experience',
    'Skills',
    'Projects',
    'Architecture',
    'Education',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.cardDark,
        border: Border(
          top: BorderSide(color: AppColors.borderDark, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 40,
      ),
      child: MaxWidthContainer(
        maxWidth: 1200,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: [
                // Logo & Title
                Column(
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.name,
                      style: AppTextStyles.cardTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppConstants.title,
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 13, color: AppColors.flutterCyan),
                    ),
                  ],
                ),

                if (!isMobile)
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => UrlHelper.launchURL(AppConstants.githubUrl),
                        tooltip: 'GitHub',
                        icon: const Icon(Icons.code, size: 20, color: AppColors.textSecondary),
                      ),
                      IconButton(
                        onPressed: () => UrlHelper.launchURL(AppConstants.linkedinUrl),
                        tooltip: 'LinkedIn',
                        icon: const Icon(Icons.link, size: 20, color: AppColors.textSecondary),
                      ),
                      IconButton(
                        onPressed: () => UrlHelper.openEmail(AppConstants.emailAddress),
                        tooltip: 'Email',
                        icon: const Icon(Icons.email, size: 20, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(color: AppColors.borderDark, height: 1),
            const SizedBox(height: 24),

            // Navigation Links
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 12,
              children: List.generate(
                navItems.length,
                (index) => InkWell(
                  onTap: () => onNavItemTap(index),
                  child: Text(
                    navItems[index],
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Copyright Notice
            Text(
              '© 2026 ${AppConstants.name}. All rights reserved.',
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
