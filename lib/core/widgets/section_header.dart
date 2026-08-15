import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String categoryTag;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.title,
    required this.categoryTag,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Category Tag Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.flutterCyan.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.flutterCyan.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            categoryTag.toUpperCase(),
            style: AppTextStyles.badgeText,
          ),
        ),
        const SizedBox(height: 12),
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: isMobile ? AppTextStyles.sectionTitleMobile : AppTextStyles.sectionTitle,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
        const SizedBox(height: 24),
        // Decorative Accent Line
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppColors.flutterGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
