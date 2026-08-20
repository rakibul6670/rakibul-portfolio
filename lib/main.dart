import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/main_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RakibulPortfolioApp());
}

class RakibulPortfolioApp extends StatelessWidget {
  const RakibulPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rakibul Hossain — Flutter Developer | Mobile Application Developer | Software Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}
