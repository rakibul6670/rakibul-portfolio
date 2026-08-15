import 'package:flutter/material.dart';
import '../models/skill_model.dart';

class SkillsData {
  static const List<SkillModel> skills = [
    // Flutter & Dart
    SkillModel(
      name: 'Flutter',
      category: 'Flutter & Dart',
      contextNote: '9+ months professional mobile app production',
      icon: Icons.phone_android,
      color: Color(0xFF02569B),
    ),
    SkillModel(
      name: 'Dart',
      category: 'Flutter & Dart',
      contextNote: 'Strong OOP, asynchronous Dart streams & isolates',
      icon: Icons.code,
      color: Color(0xFF0175C2),
    ),
    SkillModel(
      name: 'Responsive UI',
      category: 'Flutter & Dart',
      contextNote: 'Adaptive layouts for Mobile, Tablet & Desktop',
      icon: Icons.aspect_ratio,
      color: Color(0xFF54C5F8),
    ),
    SkillModel(
      name: 'Custom Widgets',
      category: 'Flutter & Dart',
      contextNote: 'Modular, reusable & pixel-perfect UI widgets',
      icon: Icons.widgets,
      color: Color(0xFF38BDF8),
    ),
    SkillModel(
      name: 'Animations',
      category: 'Flutter & Dart',
      contextNote: 'Implicit & explicit animations, CustomPainters',
      icon: Icons.auto_awesome,
      color: Color(0xFFA855F7),
    ),
    SkillModel(
      name: 'Flutter Navigation',
      category: 'Flutter & Dart',
      contextNote: 'Declarative routing, multi-stack tabs & bottom sheets',
      icon: Icons.alt_route,
      color: Color(0xFF6366F1),
    ),
    SkillModel(
      name: 'API Integration',
      category: 'Flutter & Dart',
      contextNote: 'HTTP, Dio, JSON parsing, error handling & interceptors',
      icon: Icons.api,
      color: Color(0xFF10B981),
    ),
    SkillModel(
      name: 'Firebase',
      category: 'Flutter & Dart',
      contextNote: 'Auth, Firestore, Cloud Messaging & Analytics',
      icon: Icons.local_fire_department,
      color: Color(0xFFF59E0B),
    ),

    // Architecture
    SkillModel(
      name: 'Clean Architecture',
      category: 'Architecture',
      contextNote: 'Separation into Presentation, Domain & Data layers',
      icon: Icons.layers,
      color: Color(0xFF02569B),
    ),
    SkillModel(
      name: 'MVVM Architecture',
      category: 'Architecture',
      contextNote: 'Model-View-ViewModel decoupled state architecture',
      icon: Icons.schema,
      color: Color(0xFF38BDF8),
    ),
    SkillModel(
      name: 'Feature-based Architecture',
      category: 'Architecture',
      contextNote: 'Domain feature encapsulation for 100+ screen apps',
      icon: Icons.inventory_2,
      color: Color(0xFFA855F7),
    ),
    SkillModel(
      name: 'Modular Architecture',
      category: 'Architecture',
      contextNote: 'Independent feature modules & shared core packages',
      icon: Icons.extension,
      color: Color(0xFF6366F1),
    ),
    SkillModel(
      name: 'Repository Pattern',
      category: 'Architecture',
      contextNote: 'Abstract data access separating remote & local sources',
      icon: Icons.storage,
      color: Color(0xFF10B981),
    ),
    SkillModel(
      name: 'Reusable Components',
      category: 'Architecture',
      contextNote: 'Atomic design system & consistent theme tokens',
      icon: Icons.category,
      color: Color(0xFFEC4899),
    ),

    // State Management
    SkillModel(
      name: 'GetX',
      category: 'State Management',
      contextNote: 'Reactive state management, dependency injection & routing',
      icon: Icons.bolt,
      color: Color(0xFFF59E0B),
    ),
    SkillModel(
      name: 'Provider',
      category: 'State Management',
      contextNote: 'Predictable state propagation & ChangeNotifier model',
      icon: Icons.account_tree,
      color: Color(0xFF02569B),
    ),
    SkillModel(
      name: 'RxDart',
      category: 'State Management',
      contextNote: 'ReactiveX streams, BehaviorSubject & event transformers',
      icon: Icons.all_inclusive,
      color: Color(0xFFA855F7),
    ),

    // Development
    SkillModel(
      name: 'REST API',
      category: 'Development',
      contextNote: 'RESTful architecture, CRUD operations & JWT tokens',
      icon: Icons.cloud_sync,
      color: Color(0xFF10B981),
    ),
    SkillModel(
      name: 'Authentication',
      category: 'Development',
      contextNote: 'OAuth, JWT, Firebase Auth & secure storage',
      icon: Icons.security,
      color: Color(0xFF6366F1),
    ),
    SkillModel(
      name: 'Git & GitHub',
      category: 'Development',
      contextNote: 'Version control, feature branching, PRs & code review',
      icon: Icons.source,
      color: Color(0xFFF8FAFC),
    ),
    SkillModel(
      name: 'SQLite / Sqflite',
      category: 'Development',
      contextNote: 'Local relational database, table schema design & CRUD queries',
      icon: Icons.storage_rounded,
      color: Color(0xFF0284C7),
    ),
    SkillModel(
      name: 'Local Storage',
      category: 'Development',
      contextNote: 'SharedPreferences, Hive & local key-value caching',
      icon: Icons.save_alt,
      color: Color(0xFF06B6D4),
    ),

    // Computer Science
    SkillModel(
      name: 'Data Structures (Basic)',
      category: 'Computer Science',
      contextNote: 'Basic knowledge: Arrays, Linked Lists, Stacks & Queues',
      icon: Icons.account_tree_outlined,
      color: Color(0xFF10B981),
    ),
    SkillModel(
      name: 'Stack & Queue',
      category: 'Computer Science',
      contextNote: 'Basic knowledge: LIFO & FIFO linear structure operations',
      icon: Icons.reorder,
      color: Color(0xFFF59E0B),
    ),
    SkillModel(
      name: 'OOP Fundamentals',
      category: 'Computer Science',
      contextNote: 'Encapsulation, Inheritance, Polymorphism & Abstraction',
      icon: Icons.schema_outlined,
      color: Color(0xFF38BDF8),
    ),
  ];
}
