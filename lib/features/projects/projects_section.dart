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

            // Category Filter Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(category),
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? Colors.white : AppColors.textSecondary,
                      ),
                      backgroundColor: AppColors.cardDark,
                      selectedColor: AppColors.flutterPrimary,
                      side: BorderSide(
                        color: isSelected ? AppColors.flutterCyan : AppColors.borderDark,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      onSelected: (_) {
                        setState(() => _selectedCategory = category);
                      },
                    ),
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
