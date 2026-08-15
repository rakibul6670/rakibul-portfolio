import 'package:flutter/material.dart';

class SkillModel {
  final String name;
  final String category;
  final String contextNote;
  final IconData icon;
  final Color color;

  const SkillModel({
    required this.name,
    required this.category,
    required this.contextNote,
    required this.icon,
    required this.color,
  });
}
