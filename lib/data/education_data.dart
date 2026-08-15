import '../models/education_model.dart';

class EducationData {
  static const List<EducationModel> educationList = [
    EducationModel(
      title: 'Bachelor of Science in Computer Science & Engineering',
      institution: 'Northern University Bangladesh',
      status: 'Currently Running',
      description: 'Strengthening theoretical CS foundation, software engineering principles, operating systems, and advanced computer science coursework.',
      period: 'In Progress',
      isCurrentlyRunning: true,
    ),
    EducationModel(
      title: 'Diploma in Computer Science & Engineering',
      institution: 'Polytechnic Institute',
      status: 'Completed',
      description: 'Comprehensive 4-year diploma program covering programming fundamentals, web technologies, database systems, and computer hardware.',
      period: 'Completed',
      isCurrentlyRunning: false,
    ),
    EducationModel(
      title: 'Flutter Development Course',
      institution: 'Ostad',
      status: 'Completed',
      description: 'Intensive professional training focusing on state management, REST API integration, Firebase backend, and real-world project development.',
      period: 'Completed',
      isCurrentlyRunning: false,
    ),
    EducationModel(
      title: '3-Month Professional Training',
      institution: 'BD Calling Academy',
      status: 'Completed',
      description: 'Hands-on practical development training covering mobile app workflows, UI engineering, and team collaboration best practices.',
      period: 'Completed',
      isCurrentlyRunning: false,
    ),
  ];
}
