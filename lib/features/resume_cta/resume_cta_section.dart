import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/gradient_text.dart';
import '../hero/hero_section.dart';

class ResumeCtaSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const ResumeCtaSection({
    super.key,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 60,
      ),
      child: MaxWidthContainer(
        maxWidth: 1100,
        child: GlassContainer(
          padding: EdgeInsets.all(isMobile ? 28 : 48),
          borderRadius: BorderRadius.circular(28),
          borderColor: AppColors.flutterCyan.withValues(alpha: 0.4),
          color: AppColors.cardDark,
          child: Stack(
            children: [
              // Glow orb background
              Positioned(
                right: -50,
                bottom: -50,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.flutterCyan.withValues(alpha: 0.1),
                        blurRadius: 80,
                        spreadRadius: 40,
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.flutterCyan.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.rocket_launch, size: 32, color: AppColors.flutterCyan),
                  ),
                  const SizedBox(height: 20),
                  GradientText(
                    "Let's Build Something Great",
                    style: isMobile ? AppTextStyles.sectionTitleMobile : AppTextStyles.sectionTitle,
                    gradient: AppColors.heroTextGradient,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Looking for a Flutter Developer who can turn complex requirements and modern designs into scalable, responsive and production-ready applications?',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => UrlHelper.launchURL(AppConstants.resumeDownloadUrl),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.flutterPrimary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                        ),
                        icon: const Icon(Icons.download, size: 18),
                        label: const Text(
                          'Download Resume',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: onContactTap,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          side: const BorderSide(color: AppColors.flutterCyan, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        icon: const Icon(Icons.send, size: 16, color: AppColors.flutterCyan),
                        label: const Text(
                          'Contact Me',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0),
      ),
    );
  }
}
