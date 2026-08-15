import '../models/experience_model.dart';

class ExperienceData {
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      company: 'Softvance Alpha',
      parentCompany: 'Betopia Group',
      role: 'Flutter Developer',
      duration: '9 Months Professional Experience',
      responsibilities: [
        'Building production-ready Flutter applications for cross-platform deployment.',
        'Implementing pixel-perfect responsive mobile UI systems based on Figma designs.',
        'Developing modular, highly reusable custom widget libraries across large scale apps.',
        'Integrating REST APIs with robust JSON serialization and error handling layers.',
        'Implementing local data persistence with SQLite (Sqflite) and caching mechanisms.',
        'Implementing secure user authentication (JWT tokens, OAuth, Firebase Auth).',
        'Applying Clean Architecture, MVVM, and Feature-Based modular project patterns.',
        'Utilizing state management solutions including Provider, GetX, and RxDart streams.',
        'Managing complex multi-tab navigation flows, dynamic routes, and deep links.',
        'Debugging performance bottlenecks, reducing widget rebuilds, and optimizing memory.',
        'Collaborating actively within agile development teams using Git & GitHub workflows.'
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'MVVM',
        'GetX',
        'Provider',
        'RxDart',
        'REST API',
        'SQLite / Sqflite',
        'Firebase',
        'Figma-to-Code',
        'Git/GitHub'
      ],
    ),
  ];
}
