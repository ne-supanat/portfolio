class ProjectModel {
  final String title;
  final String description;
  String? github;
  String? url;
  String? vdo;
  final List<String> tags;
  final bool highlight;

  ProjectModel({
    required this.title,
    required this.description,
    this.github,
    this.url,
    this.vdo,
    required this.tags,
    this.highlight = false,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json["title"],
      description: json["description"],
      github: json["github"],
      url: json["url"],
      vdo: json["vdo"],
      tags: List<String>.from(json["tags"] ?? []),
      highlight: json["highlight"] ?? false,
    );
  }
}
