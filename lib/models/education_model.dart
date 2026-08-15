class EducationModel {
  final String title;
  final String institution;
  final String status;
  final String description;
  final String period;
  final bool isCurrentlyRunning;

  const EducationModel({
    required this.title,
    required this.institution,
    required this.status,
    required this.description,
    required this.period,
    this.isCurrentlyRunning = false,
  });
}
