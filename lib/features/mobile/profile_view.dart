import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/theme_bloc.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/box.dart';
import 'package:portfolio/widgets/profile_section.dart';
import 'package:portfolio/widgets/skills_section.dart';

import '../../widgets/contact_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Theme.of(context).primaryColor),
              shape: BoxShape.circle,
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
        Text(
          "Flutter Developer",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: context.read<ThemeCubit>().state == lightMode ? primaryColor : Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        ProfileSection(showTitle: false),
        SizedBox(height: 24),
        SkillsSection.workSkills(),
        SizedBox(height: 16),
        SkillsSection.softSkills(),
        SizedBox(height: 16),
        SkillsSection.languageSkills(),
        SizedBox(height: 16),
        Text("Contacts".toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 8),
        AppBox(child: ContactContent()),
      ],
    );
  }
}
