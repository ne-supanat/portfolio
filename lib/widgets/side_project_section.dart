import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';
import '../theme/theme.dart';
import 'box.dart';
import 'tag.dart';

class SideProjectSection extends StatelessWidget {
  const SideProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString('assets/data/side_projects_data.json'),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final List rawItems = jsonDecode(asyncSnapshot.data!) as List;

          final highlightItems = [];
          final normalItems = [];

          for (final e in rawItems) {
            final project = ProjectModel.fromJson(e);

            if (project.highlight) {
              highlightItems.add(project);
            } else {
              normalItems.add(project);
            }
          }

          final items = [...highlightItems] + [...normalItems];

          return Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              [Text("Projects".toUpperCase(), style: Theme.of(context).textTheme.titleLarge)],
              items.map((e) => sideProjectItem(context, e)).toList(),
            ].expand((e) => e).toList(),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget sideProjectItem(BuildContext context, ProjectModel item) {
    return AppBox(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (item.highlight) Icon(Icons.star_border_rounded, color: primaryColor),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Row(
                spacing: 8,
                children: [
                  if (item.github != null)
                    InkWell(
                      child: ImageIcon(AssetImage('assets/icons/icon_github.png')),
                      onTap: () => launchUrl(Uri.parse(item.github!)),
                    ),
                  if (item.url != null)
                    InkWell(
                      child: Icon(Icons.open_in_new),
                      onTap: () => launchUrl(Uri.parse(item.url!)),
                    ),
                  if (item.vdo != null)
                    InkWell(
                      child: Icon(Icons.slideshow),
                      onTap: () => launchUrl(Uri.parse(item.vdo!)),
                    ),
                ],
              ),
            ],
          ),
          Text(item.description, style: Theme.of(context).textTheme.bodyMedium),
          TagList(items: item.tags.map((e) => "#$e").toList()),
        ],
      ),
    );
  }
}
