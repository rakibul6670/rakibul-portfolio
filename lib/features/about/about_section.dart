import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/viewport_animated_counter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
              categoryTag: 'About Me',
              title: 'Passionate Mobile Engineer & Architectural Learner',
              subtitle: 'Combining real production experience with deep computer science fundamentals',
            ),
            const SizedBox(height: 48),

            // Bio & Stats Grid with Left/Right Entrance Animations
            isMobile
                ? Column(
                    children: [
                      _buildBioCard(context).animate().fadeIn(duration: 700.ms).slideX(begin: -0.1, end: 0),
                      const SizedBox(height: 32),
                      _buildStatsGrid(context).animate().fadeIn(duration: 700.ms, delay: 200.ms).slideX(begin: 0.1, end: 0),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildBioCard(context).animate().fadeIn(duration: 800.ms).slideX(begin: -0.15, end: 0),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 5,
                        child: _buildStatsGrid(context).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: 0.15, end: 0),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBioCard(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(24),
      borderColor: AppColors.borderDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.flutterCyan.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.verified_user, color: AppColors.flutterCyan, size: 20),
              ),
              const SizedBox(width: 16),
              Text(
                'Professional Overview',
                style: AppTextStyles.cardTitle.copyWith(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "I'm ${AppConstants.name}, a Flutter Developer and Computer Science student focused on building modern, scalable and user-friendly mobile applications.",
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),
          const SizedBox(height: 16),
          Text(
            "I have 9+ months of professional experience at ${AppConstants.currentCompany}, where I've worked on real-world applications involving complex UI systems, authentication, social features, audio/video experiences, service platforms, e-commerce workflows, AI integrations and large-scale application architectures.",
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),
          const SizedBox(height: 16),
          Text(
            "Alongside professional development, I'm pursuing my BSc in Computer Science & Engineering at ${AppConstants.university} and continuously improving my knowledge of software architecture, state management, and core data structures.",
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final double childAspectRatio = isMobile ? 1.05 : 0.72;

    final List<Map<String, dynamic>> stats = [
      {
        'id': 'experience',
        'target': 9,
        'suffix': '+ Mos',
        'label': 'Months Professional Experience',
        'sub': 'At Softvance Alpha (Betopia Group)',
      },
      {
        'id': 'screens',
        'target': 700,
        'suffix': '+',
        'label': 'Estimated UI Screens Built',
        'sub': 'Pixel-perfect responsive widgets',
      },
      {
        'id': 'projects',
        'target': 7,
        'suffix': '+',
        'label': 'Real-World Projects / Modules',
        'sub': 'Social, E-com, AI, Streaming',
      },
      {
        'id': 'largest_project',
        'target': 200,
        'suffix': '+',
        'label': 'Largest Project Screen Count',
        'sub': 'Harmonic Builder & Music Academy',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        final isEven = index % 2 == 0;

        return HoverCard(
          scaleFactor: 1.03,
          child: GlassContainer(
            padding: const EdgeInsets.all(12),
            borderRadius: BorderRadius.circular(20),
            borderColor: AppColors.borderDark,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ViewportAnimatedCounter(
                      uniqueId: stat['id'] as String,
                      targetValue: stat['target'] as int,
                      suffix: stat['suffix'] as String,
                      duration: const Duration(milliseconds: 1600),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: AppColors.flutterCyan,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stat['label'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    stat['sub'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: (100 * index).ms).slideX(begin: isEven ? -0.1 : 0.1, end: 0);
      },
    );
  }
}
