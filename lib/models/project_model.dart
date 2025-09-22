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
}
