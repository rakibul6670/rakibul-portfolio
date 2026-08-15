import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';

class StateManagementSection extends StatelessWidget {
  const StateManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final List<Map<String, dynamic>> frameworks = [
      {
        'name': 'GetX',
        'tagline': 'High-performance reactive state, dependency injection & route management',
        'color': AppColors.accentAmber,
        'icon': Icons.bolt,
        'desc':
            'Provides ultra-lightweight reactive state management (`RxBool`, `Obx`), automatic dependency disposal (`Get.put()`), and declarative route navigation without context requirements.',
        'useCase': 'Ideal for large modular applications requiring fast prototyping and decoupled dependency injection.',
        'features': ['Obx / GetBuilder', 'Get.find() DI', 'Contextless Routing', 'GetxController Lifecycle'],
      },
      {
        'name': 'Provider',
        'tagline': 'Predictable state propagation & official Flutter community standard',
        'color': AppColors.flutterCyan,
        'icon': Icons.account_tree,
        'desc':
            'Encapsulates `InheritedWidget` state distribution into a clean, testable `ChangeNotifierProvider` model. Promotes unidirectional data flow and clean widget re-renders.',
        'useCase': 'Perfect for core application themes, user auth sessions, and e-commerce cart management.',
        'features': ['ChangeNotifierProvider', 'Consumer / Selector', 'MultiProvider', 'Unidirectional Data Flow'],
      },
      {
        'name': 'RxDart',
        'tagline': 'ReactiveX streams & event-driven asynchronous data flows',
        'color': AppColors.accentPurple,
        'icon': Icons.all_inclusive,
        'desc':
            'Extends Dart `Stream` capabilities with `BehaviorSubject`, `PublishSubject`, `debounceTime`, and `combineLatest` operators for complex real-time event processing.',
        'useCase': 'Essential for real-time chat feeds, audio/video stream events, search debouncing, and multi-stream sync.',
        'features': ['BehaviorSubject', 'debounceTime()', 'combineLatest', 'StreamTransformer'],
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
              categoryTag: 'State Management Expertise',
              title: 'Pragmatic State Management Approach',
              subtitle: 'Choosing the right state management tool based on application architecture and reactive requirements',
            ),
            const SizedBox(height: 48),

            // Comparison Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 0.95 : (isTablet ? 0.72 : 0.66),
              ),
              itemCount: frameworks.length,
              itemBuilder: (context, index) {
                final item = frameworks[index];
                final Color color = item['color'];

                return HoverCard(
                  scaleFactor: 1.02,
                  child: GlassContainer(
                    padding: const EdgeInsets.all(20),
                    borderRadius: BorderRadius.circular(20),
                    borderColor: color.withValues(alpha: 0.4),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: color.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(item['icon'], color: color, size: 22),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    item['name'],
                                    style: AppTextStyles.cardTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                item['tagline'],
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item['desc'],
                                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, height: 1.5),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(color: AppColors.borderDark, height: 1),
                              const SizedBox(height: 12),
                              Text(
                                'Best Use Case:',
                                style: AppTextStyles.badgeText.copyWith(color: AppColors.textMuted),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['useCase'],
                                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.textPrimary),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: (item['features'] as List<String>).map((feat) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceDark,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColors.borderDark),
                                    ),
                                    child: Text(
                                      feat,
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
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
