import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';

class PixelPerfectSection extends StatelessWidget {
  const PixelPerfectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final List<Map<String, dynamic>> highlights = [
      {
        'title': 'Figma to Flutter Precision',
        'desc': 'Translating complex designer specs, typographic hierarchies, padding metrics, and micro-interactions into exact Flutter widget trees.',
        'icon': Icons.design_services,
        'color': AppColors.accentPink,
      },
      {
        'title': 'Adaptive & Responsive Layouts',
        'desc': 'Utilizing LayoutBuilder, MediaQuery, and OrientationBuilder to ensure seamless scaling from 320px mobile screens to 4K desktop displays.',
        'icon': Icons.devices,
        'color': AppColors.flutterCyan,
      },
      {
        'title': 'Modular Design System Tokens',
        'desc': 'Establishing centralized color palettes, custom text style themes, reusable button components, and unified card elevations.',
        'icon': Icons.palette,
        'color': AppColors.accentPurple,
      },
      {
        'title': 'Custom Painters & Smooth Motion',
        'desc': 'Crafting complex geometric shapes, custom audio waveforms, chart visualizations, and GPU-friendly implicit animations.',
        'icon': Icons.auto_awesome,
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
              categoryTag: 'UI / Design Engineering',
              title: 'Pixel-Perfect UI Engineering',
              subtitle: 'Transforming high-fidelity Figma design systems into scalable, production-ready Flutter interfaces',
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
              itemCount: highlights.length,
              itemBuilder: (context, index) {
                final item = highlights[index];
                final Color color = item['color'];

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
                            child: Icon(item['icon'], color: color, size: 22),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            item['title'],
                            style: AppTextStyles.cardTitle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['desc'],
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
