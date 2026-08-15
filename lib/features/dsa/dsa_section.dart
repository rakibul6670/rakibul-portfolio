import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';

class DsaSection extends StatelessWidget {
  const DsaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final List<Map<String, dynamic>> dsaTopics = [
      {
        'title': 'Data Structures (Basic)',
        'desc': 'Basic knowledge of arrays, linked structures, data organization, and memory layout.',
        'icon': Icons.account_tree_outlined,
        'color': AppColors.flutterCyan,
      },
      {
        'title': 'Linear Data Structures',
        'desc': 'Arrays, contiguous memory allocation, multi-dimensional lists, and string manipulation.',
        'icon': Icons.reorder,
        'color': AppColors.accentEmerald,
      },
      {
        'title': 'Stack & Queue',
        'desc': 'LIFO and FIFO operations, push/pop mechanisms, call stack tracking, and queue buffering.',
        'icon': Icons.layers,
        'color': AppColors.accentPurple,
      },
      {
        'title': 'OOP & CS Fundamentals',
        'desc': 'Object-Oriented programming principles, modular code organization, and encapsulation.',
        'icon': Icons.schema_outlined,
        'color': AppColors.accentAmber,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 80,
      ),
      child: MaxWidthContainer(
        maxWidth: 1200,
        child: Column(
          children: [
            const SectionHeader(
              categoryTag: 'Computer Science Fundamentals',
              title: 'Data Structures & CS Concepts',
              subtitle: 'Basic knowledge of fundamental data structures, linear collections, and Object-Oriented concepts.',
            ),
            const SizedBox(height: 48),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 1.4 : (isTablet ? 1.1 : 0.95),
              ),
              itemCount: dsaTopics.length,
              itemBuilder: (context, index) {
                final topic = dsaTopics[index];
                final Color color = topic['color'];

                return HoverCard(
                  scaleFactor: 1.03,
                  child: GlassContainer(
                    padding: const EdgeInsets.all(20),
                    borderRadius: BorderRadius.circular(20),
                    borderColor: color.withValues(alpha: 0.3),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(topic['icon'], color: color, size: 22),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            topic['title'],
                            style: AppTextStyles.cardTitle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            topic['desc'],
                            style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: (100 * index).ms);
              },
            ),
          ],
        ),
      ),
    );
  }
}
