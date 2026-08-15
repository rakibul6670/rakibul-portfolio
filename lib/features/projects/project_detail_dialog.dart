import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../../core/widgets/glass_container.dart';
import '../../models/project_model.dart';

class ProjectDetailDialog extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailDialog({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 24 : 48,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 800),
        child: GlassContainer(
          padding: EdgeInsets.all(isMobile ? 20 : 36),
          borderRadius: BorderRadius.circular(24),
          borderColor: project.accentColor.withValues(alpha: 0.5),
          child: Column(
            children: [
              // Header Row with Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: project.accentColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(project.icon, color: project.accentColor, size: 24),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.categoryTag.toUpperCase(),
                                style: AppTextStyles.badgeText.copyWith(fontSize: 11),
                              ),
                              Text(
                                project.title,
                                style: AppTextStyles.cardTitle.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: AppColors.textSecondary, size: 22),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(color: AppColors.borderDark, height: 1),
              const SizedBox(height: 20),

              // Scrollable Case Study Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overview Section
                      _buildSectionTitle('Overview & Application Purpose'),
                      const SizedBox(height: 8),
                      Text(
                        project.fullDescription,
                        style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
                      ),

                      const SizedBox(height: 24),

                      // Scale & My Contribution
                      _buildSectionTitle('My Specific Role & Technical Contribution'),
                      const SizedBox(height: 8),
                      Text(
                        project.myContribution,
                        style: AppTextStyles.bodyMedium.copyWith(height: 1.6, color: AppColors.textPrimary),
                      ),

                      const SizedBox(height: 24),

                      // Architecture
                      _buildSectionTitle('Technical Architecture'),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceDark,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.flutterCyan.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.account_tree, size: 18, color: AppColors.flutterCyan),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                project.architecture,
                                style: AppTextStyles.codeSnippet.copyWith(fontSize: 13, color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Key Features List
                      _buildSectionTitle('Key Implemented Features'),
                      const SizedBox(height: 12),
                      Column(
                        children: project.features.map((feature) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Icon(Icons.check, size: 16, color: project.accentColor),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 24),

                      // Challenges & Solutions
                      _buildSectionTitle('Technical Challenges & Solutions'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.cardDark,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.borderDark),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.warning_amber, size: 18, color: AppColors.accentAmber),
                                SizedBox(width: 8),
                                Text(
                                  'Challenge:',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accentAmber),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(project.challenges, style: AppTextStyles.bodyMedium),
                            const SizedBox(height: 12),
                            const Row(
                              children: [
                                Icon(Icons.lightbulb_outline, size: 18, color: AppColors.accentEmerald),
                                SizedBox(width: 8),
                                Text(
                                  'Engineering Solution:',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.accentEmerald),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(project.solution, style: AppTextStyles.bodyMedium),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Technologies Used
                      _buildSectionTitle('Technologies & Libraries'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceDark,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.borderDark),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.flutterCyan),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Divider(color: AppColors.borderDark, height: 1),
              const SizedBox(height: 16),

              // Bottom Action Buttons (Figma, GitHub, Live Demo)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.end,
                children: [
                  if (project.figmaUrl != null)
                    OutlinedButton.icon(
                      onPressed: () => UrlHelper.launchURL(project.figmaUrl!),
                      icon: const Icon(Icons.design_services, size: 16, color: AppColors.accentPink),
                      label: const Text('Figma Design'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: const BorderSide(color: AppColors.borderDark),
                      ),
                    ),
                  if (project.githubUrl != null)
                    OutlinedButton.icon(
                      onPressed: () => UrlHelper.launchURL(project.githubUrl!),
                      icon: const Icon(Icons.code, size: 16),
                      label: const Text('GitHub Code'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: const BorderSide(color: AppColors.borderDark),
                      ),
                    ),
                  ElevatedButton.icon(
                    onPressed: () => UrlHelper.launchURL(project.demoUrl ?? '#'),
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: const Text('Live Demo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: project.accentColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.cardTitle.copyWith(fontSize: 16, color: AppColors.flutterCyan),
    );
  }
}
