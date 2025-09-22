import 'package:flutter/material.dart';
import 'package:portfolio/widgets/tag.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.title, required this.skills});

  final String title;
  final List<String> skills;

  factory SkillsSection.workSkills() {
    return SkillsSection(
      title: "Work Skills",
      skills: [
        "Flutter (Dart)",
        "Android (Kotlin, Java)",
        "Javascript",
        "Python",
        "Database knowledge",
        "REST API knowledge",
        "Machine Learning knowledge",
        "Simulation knowledge",
        "Optimisation knowledge",
        "General AI knowledge",
      ],
    );
  }

  factory SkillsSection.softSkills() {
    return SkillsSection(
      title: "Soft Skills",
      skills: ["Problem solving", "Time management", "Flexibility"],
    );
  }

  factory SkillsSection.languageSkills() {
    return SkillsSection(
      title: "Language Skills",
      skills: ["Thai (Native)", "English (IELTS: overall 7)"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        TagList(items: skills),
      ],
    );
  }
}
