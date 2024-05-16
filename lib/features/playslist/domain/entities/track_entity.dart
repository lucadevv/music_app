class TrackEntity {
  final int id;
  final String title;
  final String author;
  final int duration;
  final String urlMp3;
  final String imagePath;

  TrackEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.urlMp3,
    required this.imagePath,
  });

  TrackEntity.empty()
      : id = 0,
        title = "",
        author = "",
        duration = 0,
        urlMp3 = '',
        imagePath = "";
}
