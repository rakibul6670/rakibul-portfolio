import 'package:flutter/material.dart';

class AppColors {
  // Base light backgrounds
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF1F5F9);
  static const Color surfaceSubtle = Color(0xFFF8FAFC);
  static const Color borderLight = Color(0xFFE2E8F0); // Subtle 1px light border
  static const Color borderHover = Color(0xFF0284C7);

  // Aliases for compatibility
  static const Color bgDark = bgLight;
  static const Color cardDark = cardLight;
  static const Color surfaceDark = surfaceLight;
  static const Color borderDark = borderLight;

  // Flutter brand & accents (tuned for high contrast on light backgrounds)
  static const Color flutterPrimary = Color(0xFF02569B);
  static const Color flutterSecondary = Color(0xFF0175C2);
  static const Color flutterCyan = Color(0xFF0284C7); // Rich sky blue
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color accentIndigo = Color(0xFF4F46E5);
  static const Color accentAmber = Color(0xFFD97706);
  static const Color accentEmerald = Color(0xFF059669);
  static const Color accentPink = Color(0xFFDB2777);

  // Status
  static const Color onlineGreen = Color(0xFF16A34A);

  // Typography (Dark slate on light background)
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient flutterGradient = LinearGradient(
    colors: [flutterCyan, flutterPrimary, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0x150284C7), Color(0x0802569B), Color(0x157C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroTextGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
