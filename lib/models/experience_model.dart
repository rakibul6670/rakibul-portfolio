class ExperienceModel {
  final String company;
  final String parentCompany;
  final String role;
  final String duration;
  final List<String> responsibilities;
  final List<String> techStack;

  const ExperienceModel({
    required this.company,
    required this.parentCompany,
    required this.role,
    required this.duration,
    required this.responsibilities,
    required this.techStack,
  });
}
