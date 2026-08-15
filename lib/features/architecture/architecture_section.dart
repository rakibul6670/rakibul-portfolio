import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/hover_card.dart';
import '../../core/widgets/max_width_container.dart';
import '../../core/widgets/section_header.dart';

class ArchitectureSection extends StatefulWidget {
  const ArchitectureSection({super.key});

  @override
  State<ArchitectureSection> createState() => _ArchitectureSectionState();
}

class _ArchitectureSectionState extends State<ArchitectureSection> {
  int _selectedLayerIndex = 0;

  final List<Map<String, dynamic>> _layers = [
    {
      'title': 'UI Layer (Views & Modular Widgets)',
      'subtitle': 'Presentation Layer',
      'icon': Icons.smartphone,
      'color': AppColors.flutterCyan,
      'description':
          'Contains responsive Flutter screen views, custom painter widgets, stateful animation controllers, and atomic design components that stay completely free of business logic.',
      'tech': ['StatelessWidget', 'StatefulWidget', 'CustomPainter', 'MediaQuery', 'Responsive Layouts'],
    },
    {
      'title': 'ViewModel / Controller Layer',
      'subtitle': 'Application Logic & State Layer',
      'icon': Icons.bolt,
      'color': AppColors.accentPurple,
      'description':
          'Manages reactive state propagation, user intent handlers, form validations, and UI state notifications using GetX Controllers, Provider ChangeNotifiers, or RxDart stream subjects.',
      'tech': ['GetxController', 'ChangeNotifier', 'BehaviorSubject', 'StreamController', 'State Notifiers'],
    },
    {
      'title': 'Repository Layer',
      'subtitle': 'Domain & Data Abstraction',
      'icon': Icons.account_tree,
      'color': AppColors.accentAmber,
      'description':
          'Acts as a single source of truth for domain data. Decouples ViewModel logic from data fetching mechanisms by coordinating between remote network APIs and local databases.',
      'tech': ['Repository Pattern', 'Domain Models', 'Either<Failure, Data>', 'Use Cases', 'Data Mappers'],
    },
    {
      'title': 'Service / API Client Layer',
      'subtitle': 'Infrastructure & Network Layer',
      'icon': Icons.lan,
      'color': AppColors.accentEmerald,
      'description':
          'Handles raw HTTP networking, JWT token refreshment, request interceptors, WebSocket connections, WebRTC audio/video sessions, and Firebase backend communication.',
      'tech': ['HTTP Client', 'Dio Interceptors', 'WebSockets', 'Firebase Auth', 'JSON Serializer'],
    },
    {
      'title': 'Data Source (Remote & Local)',
      'subtitle': 'Persistence & Backend Layer',
      'icon': Icons.storage,
      'color': AppColors.accentPink,
      'description':
          'Stores local persistent state (Hive, SharedPreferences, Sqflite) for offline-first support and communicates with backend REST/GraphQL microservices.',
      'tech': ['Hive DB', 'SharedPreferences', 'Sqflite', 'Cloud Firestore', 'REST Microservices'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final selectedLayer = _layers[_selectedLayerIndex];

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
              categoryTag: 'Architecture Mindset',
              title: 'How I Build Scalable Flutter Applications',
              subtitle: 'Clean Architecture, MVVM principles, and modular feature separation for maintainable 100+ screen apps',
            ),
            const SizedBox(height: 48),

            // Diagram & Details Split View
            isMobile
                ? Column(
                    children: [
                      _buildDiagramFlow(context),
                      const SizedBox(height: 32),
                      _buildLayerDetails(selectedLayer),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildDiagramFlow(context).animate().fadeIn(duration: 700.ms).slideX(begin: -0.12, end: 0),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 5,
                        child: _buildLayerDetails(selectedLayer).animate().fadeIn(duration: 700.ms, delay: 150.ms).slideX(begin: 0.12, end: 0),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagramFlow(BuildContext context) {
    return Column(
      children: List.generate(_layers.length, (index) {
        final layer = _layers[index];
        final isSelected = _selectedLayerIndex == index;
        final Color color = layer['color'];

        return Column(
          children: [
            HoverCard(
              onTap: () => setState(() => _selectedLayerIndex = index),
              scaleFactor: 1.02,
              child: GlassContainer(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                borderRadius: BorderRadius.circular(16),
                borderColor: isSelected ? color : AppColors.borderDark,
                color: isSelected ? AppColors.surfaceDark : AppColors.cardDark,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(layer['icon'], color: color, size: 20),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            layer['title'],
                            style: AppTextStyles.cardTitle.copyWith(
                              fontSize: 15,
                              color: isSelected ? Colors.white : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            layer['subtitle'],
                            style: TextStyle(fontSize: 12, color: color),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isSelected ? Icons.chevron_right : Icons.check_circle_outline,
                      size: 18,
                      color: isSelected ? color : AppColors.textMuted,
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 400.ms, delay: (80 * index).ms),

            // Down Arrow Connector between layers
            if (index < _layers.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Icon(
                  Icons.arrow_downward,
                  size: 16,
                  color: AppColors.flutterCyan.withValues(alpha: 0.5),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildLayerDetails(Map<String, dynamic> layer) {
    final Color color = layer['color'];
    final List<String> techList = layer['tech'];

    return GlassContainer(
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(24),
      borderColor: color.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(layer['icon'], color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      layer['title'],
                      style: AppTextStyles.cardTitle.copyWith(fontSize: 20),
                    ),
                    Text(
                      layer['subtitle'],
                      style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.borderDark, height: 1),
          const SizedBox(height: 24),

          Text(
            'Layer Description & Responsibilities',
            style: AppTextStyles.badgeText.copyWith(color: AppColors.textMuted),
          ),
          const SizedBox(height: 10),
          Text(
            layer['description'],
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),

          const SizedBox(height: 28),

          Text(
            'Key Technologies & Patterns',
            style: AppTextStyles.badgeText.copyWith(color: AppColors.textMuted),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techList.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
