import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';
import '../../data/education_data.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final items = EducationData.educationList;

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
              categoryTag: 'Academic & Learning Journey',
              title: 'Education, Training & Continuous Growth',
              subtitle: 'From foundational computer science diploma to production engineering and ongoing university studies',
            ),
            const SizedBox(height: 48),

            // Timeline List
            Column(
              children: List.generate(items.length, (index) {
                final edu = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: HoverCard(
                    scaleFactor: 1.01,
                    child: GlassContainer(
                      padding: EdgeInsets.all(isMobile ? 20 : 28),
                      borderRadius: BorderRadius.circular(20),
                      borderColor: edu.isCurrentlyRunning
                          ? AppColors.flutterCyan.withValues(alpha: 0.4)
                          : AppColors.borderDark,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: edu.isCurrentlyRunning
                                  ? AppColors.flutterCyan.withValues(alpha: 0.2)
                                  : AppColors.surfaceDark,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              edu.isCurrentlyRunning
                                  ? Icons.school
                                  : Icons.card_membership,
                              color: edu.isCurrentlyRunning
                                  ? AppColors.flutterCyan
                                  : AppColors.textSecondary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        edu.title,
                                        style: AppTextStyles.cardTitle.copyWith(
                                          fontSize: isMobile ? 16 : 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: edu.isCurrentlyRunning
                                            ? AppColors.accentEmerald.withValues(alpha: 0.15)
                                            : AppColors.surfaceDark,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: edu.isCurrentlyRunning
                                              ? AppColors.accentEmerald.withValues(alpha: 0.4)
                                              : AppColors.borderDark,
                                        ),
                                      ),
                                      child: Text(
                                        edu.status,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: edu.isCurrentlyRunning
                                              ? AppColors.accentEmerald
                                              : AppColors.textMuted,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  edu.institution,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.flutterCyan,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  edu.description,
                                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: (100 * index).ms),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
