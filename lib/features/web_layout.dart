import 'package:flutter/material.dart';
import 'package:portfolio/widgets/avartar.dart';

import '../widgets/box.dart';
import '../widgets/contact_section.dart';
import '../widgets/profile_section.dart';
import '../widgets/side_project_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/theme_button.dart';
import '../widgets/timeline_section.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [overview(context), detail(context)],
              ),
            ),
            Positioned(top: 16, right: 16, child: ThemeButton()),
          ],
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
                Center(child: Avartar()),
                SizedBox(height: 16),
                Text(
                  "Supanat Charoenwong (Ne)".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
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
                  spacing: 8,
                  children: [
                    TimelineSection.work(),
                    _buildSeparator(context),
                    TimelineSection.education(),
                    _buildSeparator(context),
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

  Widget _buildSeparator(BuildContext context) {
    return Divider(color: Theme.of(context).primaryColor.withAlpha(80));
  }
}
