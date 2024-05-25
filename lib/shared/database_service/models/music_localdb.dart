class MusicLocalDb {
  final int id;
  final String title;
  final int duration;
  final String urlPath;
  final String imagePath;

  MusicLocalDb(
      {required this.id,
      required this.title,
      required this.duration,
      required this.urlPath,
      required this.imagePath});

  MusicLocalDb copyWith({
    int? id,
    String? title,
    int? duration,
    String? urlPath,
    String? imagePath,
  }) =>
      MusicLocalDb(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        urlPath: urlPath ?? this.urlPath,
        imagePath: imagePath ?? this.imagePath,
      );
  factory MusicLocalDb.fromMapDb(Map<String, dynamic> map) {
    return MusicLocalDb(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      urlPath: map['url'],
      imagePath: map['imagePath'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'url': urlPath,
      'imagePath': imagePath,
    };
  }
}
