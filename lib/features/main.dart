import 'package:flutter/material.dart';
import 'package:portfolio/widgets/box.dart';
import 'package:timelines_plus/timelines_plus.dart';

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
                contactContent(),
              ],
            ),
          ),
          SizedBox(height: 24),
          skillsSection(context, "Work Skills", [
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
          ]),
          SizedBox(height: 16),
          skillsSection(context, "Soft Skills", [
            "Problem solving",
            "Time management",
            "Flexibility",
          ]),
          SizedBox(height: 16),
          skillsSection(context, "Language Skills", [
            "Thai (Native)",
            "English (IELTS: overall 7)",
          ]),
        ],
      ),
    );
  }

  Widget tag({required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xff7dc3ff)),
      ),
      child: Text(label),
    );
  }

  Widget contactContent() {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactItem(Icons.email_rounded, "naesup@gmail.com"),
          contactItem(Icons.phone_rounded, "+6693-670-4299"),
          contactItem(Icons.circle, "ne-supanat"),
          contactItem(Icons.insert_drive_file_rounded, "Resume"),
        ],
      ),
    );
  }

  Widget contactItem(IconData icon, String text) {
    return Row(mainAxisSize: MainAxisSize.min, spacing: 8, children: [Icon(icon), Text(text)]);
  }

  Widget skillsSection(BuildContext context, String title, List<String> skills) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        Wrap(runSpacing: 8, spacing: 12, children: skills.map((e) => tag(label: e)).toList()),
      ],
    );
  }

  Widget detail(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        spacing: 20,
        children: [
          profile(context),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    timelineSection(context, "WORK EXPERIENCE"),
                    timelineSection(context, "EDUCATION"),
                    timelineSection(context, "AWARD & CERTIFICATION"),
                  ],
                ),
              ),
              Expanded(child: sideProjectsSection(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget profile(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile".toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        AppBox(
          child: Text(
            "Hi, I’m Flutter developer with 3+ years of professional experience in mobile application development. Skilled in creating mobile solutions with an understanding of frontend, backend, and AI technologies. Eager to apply my skill set to meaningful projects that create a positive impact.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget timelineSection(BuildContext context, String title) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
        timeline(context),
      ],
    );
  }

  Widget timeline(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: const Color(0xff989898),
        indicatorTheme: const IndicatorThemeData(position: 0, size: 20.0),
        connectorTheme: const ConnectorThemeData(thickness: 2.5),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: 4,
        contentsBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('processes[index].name'),
                AppBox(
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: Text('inner box')),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              VerticalDivider(color: Color(0xff8DCAFF)),
                              Text('inner box'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          return const OutlinedDotIndicator(borderWidth: 2.5);
        },
        connectorBuilder: (_, index, ___) => SolidLineConnector(color: null),
      ),
    );
  }

  Widget sideProjectsSection(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        [Text("Side Projects".toUpperCase(), style: Theme.of(context).textTheme.titleLarge)],
        ['a', 'b', 'c'].map((e) => sideProjectItem(context, e)).toList(),
      ].expand((e) => e).toList(),
    );
  }

  Widget sideProjectItem(BuildContext context, item) {
    return AppBox(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text("detail", style: Theme.of(context).textTheme.bodyMedium),
          Text("url", style: Theme.of(context).textTheme.bodyMedium),
          Wrap(
            runSpacing: 8,
            spacing: 12,
            children: ['python', 'Frontier Exploration'].map((e) => tag(label: e)).toList(),
          ),
        ],
      ),
    );
  }
}
