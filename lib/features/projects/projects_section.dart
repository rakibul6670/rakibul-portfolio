import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';
import '../../data/projects_data.dart';
import '../../models/project_model.dart';
import 'project_card.dart';
import 'project_detail_dialog.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Social',
    'E-commerce',
    'Entertainment',
    'AI',
    'Education',
    'Utility',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final filteredProjects = _selectedCategory == 'All'
        ? ProjectsData.projects
        : ProjectsData.projects.where((p) => p.category == _selectedCategory).toList();

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
              categoryTag: 'Featured Case Studies',
              title: 'Large-Scale Real-World Projects',
              subtitle: 'Production mobile applications featuring up to 200+ screens, complex UI systems, and Clean Architecture',
            ),
            const SizedBox(height: 40),

            // Responsive Category Filter Pills (Centered Wrap for optimal portfolio UX)
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return _ProjectCategoryPill(
                    label: category,
                    isSelected: isSelected,
                    onTap: () => setState(() => _selectedCategory = category),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),

            // Projects Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : (Responsive.isTablet(context) ? 2 : 3),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 0.85 : 0.78,
              ),
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return ProjectCard(
                  project: project,
                  onTap: () => _openProjectDialog(context, project),
                ).animate().fadeIn(duration: 400.ms, delay: (80 * (index % 6)).ms);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openProjectDialog(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ProjectDetailDialog(project: project),
    );
  }
}

class _ProjectCategoryPill extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProjectCategoryPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_ProjectCategoryPill> createState() => _ProjectCategoryPillState();
}

class _ProjectCategoryPillState extends State<_ProjectCategoryPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.flutterPrimary
                : (_isHovered ? AppColors.surfaceLight.withValues(alpha: 0.8) : AppColors.surfaceLight),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected
                  ? AppColors.flutterPrimary
                  : (_isHovered ? AppColors.flutterCyan : AppColors.borderLight),
              width: 1.2,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.flutterPrimary.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : (_isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.flutterCyan.withValues(alpha: 0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : []),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : (_isHovered ? AppColors.flutterPrimary : AppColors.textSecondary),
              letterSpacing: 0.2,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
