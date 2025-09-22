class TimelineModel {
  final String time;
  final String title;
  String? subtitle1;
  String? subtitle2;
  final List<String> detialList;

  TimelineModel({
    required this.time,
    required this.title,
    this.subtitle1,
    this.subtitle2,
    required this.detialList,
  });
}
