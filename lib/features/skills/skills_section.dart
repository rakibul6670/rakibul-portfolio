import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';
import '../../data/skills_data.dart';
import '../../models/skill_model.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Flutter & Dart',
    'Architecture',
    'State Management',
    'Development',
    'Computer Science',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final filteredSkills = _selectedCategory == 'All'
        ? SkillsData.skills
        : SkillsData.skills.where((s) => s.category == _selectedCategory).toList();

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
              categoryTag: 'Technical Ecosystem',
              title: 'Core Professional Competencies',
              subtitle: 'An interactive breakdown of Flutter engineering, architecture, state management & CS concepts',
            ),
            const SizedBox(height: 40),

            // Category Tabs
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

            // Skills Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : (Responsive.isTablet(context) ? 2 : 4),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.6,
              ),
              itemCount: filteredSkills.length,
              itemBuilder: (context, index) {
                final skill = filteredSkills[index];
                return _buildSkillCard(skill, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(SkillModel skill, int index) {
    return HoverCard(
      scaleFactor: 1.03,
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(16),
        borderColor: skill.color.withValues(alpha: 0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: skill.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(skill.icon, color: skill.color, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    skill.name,
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              skill.contextNote,
              style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.textMuted),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms, delay: (50 * (index % 8)).ms);
  }
}
