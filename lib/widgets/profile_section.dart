import 'package:flutter/material.dart';
import 'package:portfolio/widgets/box.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, this.showTitle = false});

  final bool showTitle;

  factory ProfileSection.web() {
    return ProfileSection(showTitle: true);
  }

  factory ProfileSection.mobile() {
    return ProfileSection(showTitle: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text("About me".toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        AppBox(
          child: Text(
            "Hi, I’m Flutter developer with 3+ years of professional experience in mobile application development. Skilled in creating mobile solutions with an understanding of frontend, backend, and AI technologies. Eager to apply my skill set to meaningful projects that create a positive impact.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
