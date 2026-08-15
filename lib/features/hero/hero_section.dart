import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/gradient_text.dart';
import '../../core/widgets/max_width_container.dart';

export '../../core/widgets/max_width_container.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWorkTap;
  final VoidCallback onConnectTap;

  const HeroSection({
    super.key,
    required this.onViewWorkTap,
    required this.onConnectTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _floatingController;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: isMobile ? 650 : 800),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ambient Background Glow Orbs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.flutterCyan.withValues(alpha: 0.08),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentPurple.withValues(alpha: 0.06),
                    blurRadius: 120,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // Content Layout
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 64,
              vertical: isMobile ? 40 : 80,
            ),
            child: MaxWidthContainer(
              maxWidth: 1200,
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: _buildHeroLeftText(context)),
                        const SizedBox(width: 48),
                        Expanded(flex: 5, child: _buildHeroRightProfile(context)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildHeroRightProfile(context),
                        const SizedBox(height: 40),
                        _buildHeroLeftText(context),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroLeftText(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Availability pill badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.flutterCyan.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle, size: 10, color: AppColors.flutterCyan),
              const SizedBox(width: 8),
              Text(
                "Hi, I'm ${AppConstants.name}",
                style: AppTextStyles.badgeText.copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),

        const SizedBox(height: 20),

        // Main Title
        GradientText(
          'Flutter Developer\nBuilding Modern Digital Experiences',
          style: isMobile ? AppTextStyles.heroHeadingMobile : AppTextStyles.heroHeading,
          gradient: AppColors.heroTextGradient,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),

        const SizedBox(height: 20),

        // Tagline Subtitle
        Text(
          AppConstants.heroTagline,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.bodyLarge,
        ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideY(begin: 0.2, end: 0),

        const SizedBox(height: 36),

        // CTA Buttons
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            // Primary CTA: View My Work
            ElevatedButton.icon(
              onPressed: widget.onViewWorkTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.flutterPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 8,
                shadowColor: AppColors.flutterCyan.withValues(alpha: 0.4),
              ),
              icon: const Icon(Icons.work_outline, size: 18),
              label: const Text(
                'View My Work',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),

            // Secondary CTA: Download Resume
            OutlinedButton.icon(
              onPressed: () => UrlHelper.launchURL(AppConstants.resumeDownloadUrl),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                side: const BorderSide(color: AppColors.borderDark, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.download, size: 18, color: AppColors.flutterCyan),
              label: const Text(
                'Download Resume',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),

            // Tertiary CTA: Let's Connect
            TextButton.icon(
              onPressed: widget.onConnectTap,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
              icon: const Icon(Icons.send, size: 16, color: AppColors.accentPurple),
              label: const Text(
                "Let's Connect",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
      ],
    );
  }

  Widget _buildHeroRightProfile(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        final floatVal = math.sin(_floatingController.value * math.pi * 2) * 8.0;
        return Transform.translate(
          offset: Offset(0, floatVal),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Glowing Outer Frame Backdrop
              Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: const [
                      AppColors.flutterCyan,
                      AppColors.flutterPrimary,
                      AppColors.accentPurple,
                      AppColors.flutterCyan,
                    ],
                    transform: GradientRotation(_floatingController.value * math.pi * 2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.flutterCyan.withValues(alpha: 0.3),
                      blurRadius: 40,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),

              // Profile Avatar Container
              Container(
                width: 304,
                height: 304,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgDark,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(152),
                  child: Image.asset(
                    AppAssets.profilePic,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.surfaceDark,
                      child: const Center(
                        child: Icon(Icons.person, size: 80, color: AppColors.flutterCyan),
                      ),
                    ),
                  ),
                ),
              ),

              // Floating Badge 1: Flutter
              Positioned(
                top: 10,
                left: -20,
                child: _buildFloatingBadge(
                  icon: Icons.flutter_dash,
                  label: 'Flutter',
                  color: AppColors.flutterCyan,
                ),
              ),

              // Floating Badge 2: Dart
              Positioned(
                bottom: 20,
                right: -20,
                child: _buildFloatingBadge(
                  icon: Icons.code,
                  label: 'Dart',
                  color: AppColors.flutterPrimary,
                ),
              ),

              // Floating Badge 3: Clean Architecture
              Positioned(
                top: 40,
                right: -30,
                child: _buildFloatingBadge(
                  icon: Icons.layers,
                  label: 'Clean Arch',
                  color: AppColors.accentPurple,
                ),
              ),

              // Floating Badge 4: 9+ Months Exp
              Positioned(
                bottom: 10,
                left: -15,
                child: _buildFloatingBadge(
                  icon: Icons.military_tech,
                  label: '9+ Months Exp',
                  color: AppColors.accentAmber,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      borderRadius: BorderRadius.circular(20),
      borderColor: color.withValues(alpha: 0.4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
