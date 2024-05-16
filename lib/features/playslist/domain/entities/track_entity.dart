class TrackEntity {
  final int id;
  final String title;
  final String author;
  final int duration;

  final String urlMp3;

  TrackEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.urlMp3,
  });
}
