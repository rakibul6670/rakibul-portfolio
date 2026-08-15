import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/url_helper.dart';

class Navbar extends StatelessWidget {
  final Function(int) onNavItemTap;
  final int activeIndex;
  final VoidCallback onOpenDrawer;

  const Navbar({
    super.key,
    required this.onNavItemTap,
    required this.activeIndex,
    required this.onOpenDrawer,
  });

  static const List<String> navItems = [
    'Home',
    'About',
    'Experience',
    'Skills',
    'Projects',
    'Architecture',
    'Education',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool showDesktopNav = screenWidth >= 1050;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.bgDark.withValues(alpha: 0.85),
            border: const Border(
              bottom: BorderSide(color: AppColors.borderDark, width: 1),
            ),
          ),
          child: Row(
            children: [
              // Logo / Name Badge
              InkWell(
                onTap: () => onNavItemTap(0),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: AppColors.flutterGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.code,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.name,
                            style: AppTextStyles.cardTitle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.onlineGreen,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Available for Opportunities',
                                style: AppTextStyles.badgeText.copyWith(
                                  fontSize: 10,
                                  color: AppColors.onlineGreen,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              // Desktop Nav Links or Mobile/Tablet Drawer Toggle
              if (showDesktopNav) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    navItems.length,
                    (index) => _NavButton(
                      title: navItems[index],
                      isActive: activeIndex == index,
                      onTap: () => onNavItemTap(index),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => UrlHelper.launchURL(AppConstants.resumeDownloadUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.flutterPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.download, size: 14),
                  label: const Text(
                    'Resume',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ] else ...[
                // Mobile/Tablet Menu Hamburger Button
                IconButton(
                  onPressed: onOpenDrawer,
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: widget.isActive || _isHovered ? FontWeight.w600 : FontWeight.w400,
                  color: widget.isActive
                      ? AppColors.flutterCyan
                      : (_isHovered ? AppColors.textPrimary : AppColors.textSecondary),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isActive ? 16 : (_isHovered ? 8 : 0),
                decoration: BoxDecoration(
                  color: AppColors.flutterCyan,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
