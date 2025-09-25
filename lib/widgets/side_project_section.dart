import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';
import '../theme/theme.dart';
import 'box.dart';
import 'tag.dart';

class SideProjectSection extends StatelessWidget {
  const SideProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ProjectModel(
        title: "Translate Qualitative Data into Simulation Model with Help of LLMs",
        description:
            "A research project study the benefits of using LLMs for translating qualitative data into ABM simulation. The system adopts human-AI workflow and produce Conceptual model, Decision rules, and a usabel Simulation model as final outputs.",
        github: "https://github.com/ne-supanat/uon_dissertation",
        url: "https://drive.google.com/file/d/1RlUhSKr7A_eo_XXW7iQZOHr5qizQ2y-4/view?usp=sharing",
        tags: ["Python", "Large Language Model (LLM)", "Agent-Based Modeling (ABM)", "Simulation"],
      ),
      ProjectModel(
        title: "Multi-Agent for Exploration",
        description:
            "A Multi agent system built with python. the system experiments and compares different algorithms for exploration tasks in obscure static environment",
        github: "https://github.com/ne-supanat/multi-agent-exploration",
        tags: ["Python", "Exploration", "Multi Agent System (MAS)"],
      ),
      ProjectModel(
        title: "Diet Visualisation",
        description:
            "A visualisation project, generating static and interactive visualisations for environmeneal impact from diet and food consumption based on research by Scarborough et al. in 2023",
        github: "https://github.com/ne-supanat/diet_visualisation",
        tags: ["Python", "Visualisation", "Plotly"],
      ),
      ProjectModel(
        title: "Steam Chatbot",
        description:
            "A chat bot built with Python. It can understand natural language and help users to find and buy their dream games.",
        github: "https://github.com/ne-supanat/uon_chatbot",
        tags: ["Python", "Chat Bot", "Natural Language Processing (NLP)", "Human-AI Interaction"],
      ),
      ProjectModel(
        title: "Life Portfolio",
        description:
            "A Flutter app, plotting different aspects of individual life, allowing users to consider current state of their life, answering questions 'Are you happy' and 'What should be changed'.",
        github: "https://github.com/ne-supanat/life_portfolio",
        url: "https://ne-supanat.github.io/life_portfolio/",
        tags: ["Flutter", "Life"],
      ),
      ProjectModel(
        title: "Ocean Kitchen",
        description:
            "A Godot game, played as a bubble pick up ingredients and use them to satisfied the gods who provided resources for the kitchen. The game also supports multi-players feature",
        github: "https://github.com/ne-supanat/pixel_aqua",
        url: "https://nelynx09.itch.io/ocean-kitchen",
        tags: ["Godot", "Pixel Game Jam 2024"],
      ),
      ProjectModel(
        title: "Divisible Game",
        description:
            "A Flutter game, players must find divisible numbers popup on the board within limited time",
        github: "https://github.com/ne-supanat/divisible_game",
        tags: ["Flutter", "Game"],
      ),
      ProjectModel(
        title: "ProsnCons",
        description: "An utility app helps users compare pros and cons of the considering option",
        github: "https://github.com/ne-supanat/prosncons",
        tags: ["Flutter", "Utility"],
      ),
      ProjectModel(
        title: "AIdentity",
        description:
            "Playing as a detective interrogating characters played by AI. Ask questions, analyze their responses, and identify who they are.",
        github: "https://github.com/ne-supanat/detective",
        url: "https://ne-supanat.github.io/detective_build/",
        vdo: "https://youtu.be/kSLjGrF9Abk",
        tags: ["Flutter", "Gemini", "Google", "Hackaton", "Game"],
      ),
      ProjectModel(
        title: "Waste Wise",
        description:
            "A waste management practice card game. Matching objects with their correct waste categories, encouraging people to aware about environment and sustainability with a cozy vibe in game.",
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
        description:
            "A simple plinko game, testing physics and collisions system, built with Flutter",
        github: "https://github.com/ne-supanat/pingko",
        url: "https://nelynx09.itch.io/pingko",
        tags: ["Flutter", "Physics", "Game"],
      ),
      ProjectModel(
        title: "Iridescent Slide Puzzle",
        description: "A small slide puzzle game implemented in Flutter",
        github: "https://github.com/ne-supanat/puzzle_slide_gradient",
        url: "https://ne-supanat.github.io/puzzle_slide_gradient/",
        vdo: "https://youtu.be/CNyeJMS6JbQ",
        tags: ["Flutter", "Hackaton", "Game"],
        highlight: true,
      ),
    ];

    items.sort((a, b) => a.highlight ? -1 : 1); // hightlighted items first

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
                child: Row(
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
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
