import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/widgets/box.dart';
import 'package:portfolio/widgets/tag.dart';
import 'package:url_launcher/url_launcher.dart';

class SideProjectSection extends StatelessWidget {
  const SideProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ProjectModel(
        title: "Translate Qualitative Data into Simulation Model with Help of LLMs",
        description: "",
        github: "https://github.com/ne-supanat/uon_dissertation",
        url: "https://drive.google.com/file/d/1RlUhSKr7A_eo_XXW7iQZOHr5qizQ2y-4/view?usp=sharing",
        tags: ["Python", "Large Language Model (LLM)", "Agent-Based Modeling (ABM)", "Simulation"],
      ),
      ProjectModel(
        title: "Multi-Agent for Exploration",
        description: "",
        github: "https://github.com/ne-supanat/multi-agent-exploration",
        tags: ["Python", "Exploration", "Multi Agent System (MAS)"],
      ),
      ProjectModel(
        title: "Diet Visualisation",
        description: "",
        github: "https://github.com/ne-supanat/diet_visualisation",
        tags: ["Python", "Visualisation", "Plotly"],
      ),
      ProjectModel(
        title: "Steam Chatbot",
        description: "",
        github: "https://github.com/ne-supanat/uon_chatbot",
        tags: ["Python", "Chat Bot", "Natural Language Processing (NLP)", "Human-AI Interaction"],
      ),
      ProjectModel(
        title: "Life Portfolio",
        description: "",
        github: "https://github.com/ne-supanat/life_portfolio",
        tags: ["Flutter", "Life"],
      ),
      ProjectModel(
        title: "Ocean Kitchen",
        description: "",
        github: "https://github.com/ne-supanat/pixel_aqua",
        url: "https://nelynx09.itch.io/ocean-kitchen",
        tags: ["Godot", "Pixel Game Jam 2024"],
      ),
      ProjectModel(
        title: "Divisible Game",
        description: "",
        github: "https://github.com/ne-supanat/divisible_game",
        tags: ["Flutter", "Game"],
      ),
      ProjectModel(
        title: "ProsnCons",
        description: "",
        github: "https://github.com/ne-supanat/prosncons",
        tags: ["Flutter", "Utility"],
      ),
      ProjectModel(
        title: "AIdentity",
        description: "",
        github: "https://github.com/ne-supanat/detective",
        url: "https://ne-supanat.github.io/detective_build/",
        vdo: "https://youtu.be/kSLjGrF9Abk",
        tags: ["Flutter", "Gemini", "Google", "Hackaton", "Game"],
      ),
      ProjectModel(
        title: "Waste Wise",
        description: "",
        github: "https://github.com/ne-supanat/project_s",
        url: "https://ne-supanat.github.io/project_s_build/",
        vdo: "https://youtu.be/xTq0znYHN5U",
        tags: ["Flutter", "Global Citizen", "Google", "Hackaton", "Game"],
        highlight: true,
      ),
      ProjectModel(
        title: "Cat Say Browser extension",
        description:
            "A chrome extension that adds a cute cat on webpage. Users can select one from 7 cats and can interact by clicking on the cat to reveal humorous or motivational messages.",
        github: "https://github.com/ne-supanat/cat_say_extension",
        tags: ["HTML", "Javascript", "Browser Extension"],
      ),
      ProjectModel(
        title: "Pingko",
        description: "",
        github: "https://github.com/ne-supanat/pingko",
        url: "https://nelynx09.itch.io/pingko",
        tags: ["Flutter", "Physics", "Game"],
      ),
      ProjectModel(
        title: "Gradient Slide Puzzle",
        description: "",
        github: "https://github.com/ne-supanat/puzzle_slide_gradient",
        vdo: "https://youtu.be/CNyeJMS6JbQ",
        tags: ["Flutter", "Hackaton", "Game"],
      ),
    ];

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        [Text("Side Projects".toUpperCase(), style: Theme.of(context).textTheme.titleLarge)],
        items.map((e) => sideProjectItem(context, e)).toList(),
      ].expand((e) => e).toList(),
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
                child: Text(
                  item.title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
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
