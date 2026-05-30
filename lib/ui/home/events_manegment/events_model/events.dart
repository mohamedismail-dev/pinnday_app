class Events {
  final String id;
  final String title;
  final String description;
  final String type;
  final String bgImage;
  final String eventImage;
  final String date;
  final String time;
  final bool isFavorite;

  Events({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.bgImage,
    required this.eventImage,
    required this.date,
    required this.time,
    this.isFavorite = false,
  });
}
