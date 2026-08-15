import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String category;
  final String categoryTag;
  final String scale;
  final String shortDescription;
  final String fullDescription;
  final String myContribution;
  final String architecture;
  final List<String> features;
  final List<String> technologies;
  final String? figmaUrl;
  final String? githubUrl;
  final String? demoUrl;
  final Color accentColor;
  final String highlightBadge;
  final String challenges;
  final String solution;
  final IconData icon;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.categoryTag,
    required this.scale,
    required this.shortDescription,
    required this.fullDescription,
    required this.myContribution,
    required this.architecture,
    required this.features,
    required this.technologies,
    this.figmaUrl,
    this.githubUrl,
    this.demoUrl,
    required this.accentColor,
    required this.highlightBadge,
    required this.challenges,
    required this.solution,
    required this.icon,
  });
}
