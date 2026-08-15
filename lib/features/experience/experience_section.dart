import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/section_header.dart';
import '../../data/experience_data.dart';
import '../../models/experience_model.dart';
import '../hero/hero_section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final exp = ExperienceData.experiences.first;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 80,
      ),
      child: MaxWidthContainer(
        maxWidth: 1100,
        child: Column(
          children: [
            const SectionHeader(
              categoryTag: 'Professional Experience',
              title: 'Production Engineering & Software Experience',
              subtitle: '9+ months building production-grade Flutter applications in a high-growth tech group',
            ),
            const SizedBox(height: 48),

            // Experience Timeline Card
            HoverCard(
              scaleFactor: 1.01,
              child: GlassContainer(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                borderRadius: BorderRadius.circular(24),
                borderColor: AppColors.flutterCyan.withValues(alpha: 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCompanyHeader(exp),
                              const SizedBox(height: 12),
                              _buildDurationBadge(exp),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCompanyHeader(exp),
                              _buildDurationBadge(exp),
                            ],
                          ),

                    const SizedBox(height: 24),
                    const Divider(color: AppColors.borderDark, height: 1),
                    const SizedBox(height: 24),

                    Text(
                      'Core Responsibilities & Technical Contributions',
                      style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 16),

                    // Responsibilities Bullet List
                    Column(
                      children: exp.responsibilities
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: AppColors.flutterCyan,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.check, size: 10, color: AppColors.bgDark),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: 24),
                    Text(
                      'Environment & Tech Stack',
                      style: AppTextStyles.badgeText.copyWith(color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 12),

                    // Tech Stack Chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: exp.techStack
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceDark,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.borderDark),
                                ),
                                child: Text(
                                  tech,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.flutterCyan,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyHeader(ExperienceModel exp) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.flutterPrimary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.4)),
          ),
          child: const Icon(Icons.business, color: AppColors.flutterCyan, size: 28),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exp.company,
              style: AppTextStyles.cardTitle.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  exp.role,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.flutterCyan),
                ),
                const SizedBox(width: 8),
                Text(
                  '• (${exp.parentCompany})',
                  style: const TextStyle(fontSize: 14, color: AppColors.textMuted),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDurationBadge(ExperienceModel exp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accentEmerald.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.schedule, size: 14, color: AppColors.accentEmerald),
          const SizedBox(width: 8),
          Text(
            exp.duration,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.accentEmerald),
          ),
        ],
      ),
    );
  }
}
