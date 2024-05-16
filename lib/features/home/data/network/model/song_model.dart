import 'package:music_app/features/home/data/network/model/creator_model_db.dart';

class SongModel {
  final int id;
  final bool readable;
  final String title;
  final String titleShort;
  final String titleVersion;
  final String link;
  final int duration;
  final int rank;
  final bool explicitLyrics;
  final int explicitContentLyrics;
  final int explicitContentCover;
  final String preview;
  final String md5Image;
  final int timeAdd;
  final Creator artist;

  SongModel({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.timeAdd,
    required this.artist,
  });

  SongModel copyWith({
    int? id,
    bool? readable,
    String? title,
    String? titleShort,
    String? titleVersion,
    String? link,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    int? timeAdd,
    Creator? artist,
  }) =>
      SongModel(
        id: id ?? this.id,
        readable: readable ?? this.readable,
        title: title ?? this.title,
        titleShort: titleShort ?? this.titleShort,
        titleVersion: titleVersion ?? this.titleVersion,
        link: link ?? this.link,
        duration: duration ?? this.duration,
        rank: rank ?? this.rank,
        explicitLyrics: explicitLyrics ?? this.explicitLyrics,
        explicitContentLyrics:
            explicitContentLyrics ?? this.explicitContentLyrics,
        explicitContentCover: explicitContentCover ?? this.explicitContentCover,
        preview: preview ?? this.preview,
        md5Image: md5Image ?? this.md5Image,
        timeAdd: timeAdd ?? this.timeAdd,
        artist: artist ?? this.artist,
      );

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        timeAdd: json["time_add"],
        artist: Creator.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "time_add": timeAdd,
        "artist": artist.toJson(),
      };
}
