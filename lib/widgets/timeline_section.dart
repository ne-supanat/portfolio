import 'package:flutter/material.dart';
import 'package:super_bullet_list/bullet_list.dart';

import '../models/timeline_model.dart';
import 'box.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key, required this.title, required this.items});

  final String title;
  final List<TimelineModel> items;

  factory TimelineSection.education() {
    final items = [
      TimelineModel(
        time: "SEP 2024 - SEP 2025",
        title: "University of Nottingham",
        subtitle1: "(Nottingham, UK)",
        detialList: ["MSc - Computer Science (Artificial Intelligence)"],
      ),
      TimelineModel(
        time: "MAY 2016 - MAY 2020",
        title: "Thai - Nichi Institute of technology",
        subtitle1: "(Bangkok, Thailand)",
        detialList: ["BSc - Multi-Media Technology Graduated with First-class honours"],
      ),
      TimelineModel(
        time: "MAY 2013 - MAY 2016",
        title: "Kasetsart University Laboratory School",
        subtitle1: "(Bangkok, Thailand)",
        detialList: ["High school - Major: Math-Science"],
      ),
    ];

    return TimelineSection(title: "Education", items: items);
  }

  factory TimelineSection.work() {
    final items = [
      TimelineModel(
        time: "APR 2020 - APR 2023",
        title: "Smartsoftasia Co., Ltd",
        subtitle1: "(Bangkok, Thailand)",
        subtitle2: "Position: Mobile App Developer",
        detialList: [
          "Developed medium to large-scale more than 10 mobile applications using Flutter and Android",
          "Collaborated with team to understand requirements and deliver high-quality applications",
          "Estimate the project and plan timeline",
          "Development and solve problems during the process",
        ],
      ),
      TimelineModel(
        time: "APR 2019 - JUN 2019",
        title: "Apppi Co., Ltd",
        subtitle1: "(Bangkok, Thailand)",
        subtitle2: "Position: Android Developer Intern",
        detialList: [
          "Assisted in the development of Android applications",
          "Gained hands-on experience in the software development proces",
        ],
      ),
      TimelineModel(
        time: "From time to time",
        title: "Freelance",
        subtitle2: "Position: Flutter Developer",
        detialList: [
          "Taken care of the project in many aspects including client communication, task process, timeline and compensation tracking.",
        ],
      ),
    ];

    return TimelineSection(title: "Work Experience", items: items);
  }

  factory TimelineSection.award() {
    final items = [
      TimelineModel(
        time: "APR 2025",
        title: "CS50x Puzzle Day 2025",
        detialList: ["Event by Havard University"],
      ),
      TimelineModel(
        time: "MAY 2024 ",
        title: "Global Gamers Challenge",
        subtitle1: "(Flutter, Global Citizen)",
        detialList: ["Top 10 winners", "Create a sustainable game using Flutter"],
      ),
      TimelineModel(
        time: "APR 2024",
        title: "CS50AI",
        detialList: ["Online course: introduction to AI by Harvard University"],
      ),
      TimelineModel(
        time: "NOV 2023",
        title: "CS50x",
        detialList: ["Online course: computer science by Harvard University"],
      ),
      TimelineModel(
        time: "MAR 2020",
        title: "Ministry of Industry's Application Contest",
        detialList: [
          "Winning 2nd place",
          "Create a demo of ministry's news & information mobile application",
        ],
      ),
      TimelineModel(
        time: "JAN 2018, JAN 2017",
        title: "Global Game Jam",
        subtitle2: "Role: Programmer",
        detialList: ["Participation certifications"],
      ),
      TimelineModel(
        time: "MAR 2017",
        title: "MOS Olympic Thailand Competition",
        detialList: ["Winning 1st place in Powerpoint contest"],
      ),
    ];

    return TimelineSection(title: "Award & Certification", items: items);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => item(context, items[index]),
          separatorBuilder: (context, index) => SizedBox(height: 16),
        ),
      ],
    );
  }

  Widget item(BuildContext context, TimelineModel item) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.time.toUpperCase(), style: Theme.of(context).textTheme.labelMedium),
        AppBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: item.title.toUpperCase(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    if (item.subtitle1 != null)
                      TextSpan(
                        text: " ${item.subtitle1}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
              if (item.subtitle2 != null)
                Text(item.subtitle2!, style: Theme.of(context).textTheme.bodyMedium),
              Divider(color: Color(0xff8DCAFF)),
              SuperBulletList(
                isOrdered: true,
                separator: SizedBox(height: 4.0),
                gap: 8,
                customBullet: Text("•", style: Theme.of(context).textTheme.bodyMedium),
                crossAxisAlignment: CrossAxisAlignment.start,
                items: item.detialList
                    .map((e) => Text(e, style: Theme.of(context).textTheme.bodyMedium))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
