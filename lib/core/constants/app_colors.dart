import 'package:flutter/material.dart';

class AppColors {
  // Base dark backgrounds
  static const Color bgDark = Color(0xFF08090D);
  static const Color cardDark = Color(0xFF101218);
  static const Color surfaceDark = Color(0xFF151821);
  static const Color surfaceLight = Color(0xFF1E2230);
  static const Color borderDark = Color(0x1FFFFFFF); // 12% white opacity
  static const Color borderHover = Color(0x4054C5F8);

  // Flutter brand & accents
  static const Color flutterPrimary = Color(0xFF02569B);
  static const Color flutterSecondary = Color(0xFF0175C2);
  static const Color flutterCyan = Color(0xFF54C5F8);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentIndigo = Color(0xFF6366F1);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentEmerald = Color(0xFF10B981);
  static const Color accentPink = Color(0xFFEC4899);

  // Status
  static const Color onlineGreen = Color(0xFF22C55E);

  // Typography
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient flutterGradient = LinearGradient(
    colors: [flutterCyan, flutterPrimary, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0x3054C5F8), Color(0x1002569B), Color(0x30A855F7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroTextGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFCBD5E1), Color(0xFF54C5F8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
