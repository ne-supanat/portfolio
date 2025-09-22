import 'package:flutter/material.dart';
import 'package:portfolio/widgets/side_project_section.dart';
import '../widgets/box.dart';
import '../widgets/contact_section.dart';
import '../widgets/profile_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/timeline_section.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFCFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [overview(context), detail(context)],
          ),
        ),
      ),
    );
  }

  Widget overview(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBox(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 6),
                      shape: BoxShape.circle,
                      color: Color(0xff313445),
                    ),
                    child: CircleAvatar(maxRadius: 62),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Supanat Charoenwong (Ne)".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text("Flutter Developer", style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 16),
                ContactContent(),
              ],
            ),
          ),
          SizedBox(height: 24),
          SkillsSection.workSkills(),
          SizedBox(height: 16),
          SkillsSection.softSkills(),
          SizedBox(height: 16),
          SkillsSection.languageSkills(),
        ],
      ),
    );
  }

  Widget detail(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        spacing: 20,
        children: [
          ProfileSection.web(),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    TimelineSection.work(),
                    TimelineSection.education(),
                    TimelineSection.award(),
                  ],
                ),
              ),
              Expanded(child: SideProjectSection()),
            ],
          ),
        ],
      ),
    );
  }
}
