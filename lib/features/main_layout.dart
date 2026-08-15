import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../core/utils/url_helper.dart';
import 'about/about_section.dart';
import 'architecture/architecture_section.dart';
import 'contact/contact_section.dart';
import 'dsa/dsa_section.dart';
import 'education/education_section.dart';
import 'experience/experience_section.dart';
import 'footer/footer_section.dart';
import 'hero/hero_section.dart';
import 'navbar/navbar.dart';
import 'pixel_perfect/pixel_perfect_section.dart';
import 'projects/projects_section.dart';
import 'resume_cta/resume_cta_section.dart';
import 'skills/skills_section.dart';
import 'state_management/state_management_section.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final keyContext = _sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 200 && position.dy + box.size.height > 200) {
            if (_activeIndex != i) {
              setState(() => _activeIndex = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final keyContext = _sectionKeys[index].currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bgDark,
      endDrawer: Drawer(
        backgroundColor: AppColors.cardDark,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.surfaceDark),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Flutter Developer',
                      style: TextStyle(fontSize: 13, color: AppColors.flutterCyan),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  Navbar.navItems.length,
                  (index) => ListTile(
                    title: Text(
                      Navbar.navItems[index],
                      style: TextStyle(
                        color: _activeIndex == index ? AppColors.flutterCyan : AppColors.textPrimary,
                        fontWeight: _activeIndex == index ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      _scrollToSection(index);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () => UrlHelper.launchURL(AppConstants.resumeDownloadUrl),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.flutterPrimary,
                  minimumSize: const Size(double.infinity, 48),
                ),
                icon: const Icon(Icons.download, size: 16),
                label: const Text('Download Resume'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 72),

                // 0: Home
                Container(
                  key: _sectionKeys[0],
                  child: HeroSection(
                    onViewWorkTap: () => _scrollToSection(4),
                    onConnectTap: () => _scrollToSection(7),
                  ),
                ),

                // 1: About
                Container(
                  key: _sectionKeys[1],
                  child: const AboutSection(),
                ),

                // 2: Experience
                Container(
                  key: _sectionKeys[2],
                  child: const ExperienceSection(),
                ),

                // 3: Skills
                Container(
                  key: _sectionKeys[3],
                  child: const SkillsSection(),
                ),

                // 4: Projects
                Container(
                  key: _sectionKeys[4],
                  child: const ProjectsSection(),
                ),

                // 5: Architecture
                Container(
                  key: _sectionKeys[5],
                  child: const Column(
                    children: [
                      ArchitectureSection(),
                      StateManagementSection(),
                      PixelPerfectSection(),
                    ],
                  ),
                ),

                // 6: Education
                Container(
                  key: _sectionKeys[6],
                  child: Column(
                    children: [
                      const EducationSection(),
                      const DsaSection(),
                      ResumeCtaSection(onContactTap: () => _scrollToSection(7)),
                    ],
                  ),
                ),

                // 7: Contact
                Container(
                  key: _sectionKeys[7],
                  child: const ContactSection(),
                ),

                // Footer
                FooterSection(
                  onNavItemTap: _scrollToSection,
                ),
              ],
            ),
          ),

          // Sticky Glass Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              activeIndex: _activeIndex,
              onNavItemTap: _scrollToSection,
              onOpenDrawer: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
