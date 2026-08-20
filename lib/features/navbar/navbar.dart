import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
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
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.bgLight.withValues(alpha: 0.88),
            border: const Border(
              bottom: BorderSide(color: AppColors.borderLight, width: 1),
            ),
          ),
          child: Row(
            children: [
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
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => UrlHelper.launchURL(AppConstants.resumeDownloadUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.flutterPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.download, size: 15),
                  label: const Text(
                    'Resume',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ] else ...[
                const Spacer(),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: widget.isActive || _isHovered ? FontWeight.w600 : FontWeight.w500,
                  color: widget.isActive
                      ? AppColors.flutterCyan
                      : (_isHovered ? AppColors.flutterPrimary : AppColors.textSecondary),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isActive ? 18 : (_isHovered ? 10 : 0),
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
