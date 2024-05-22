import 'package:music_app/features/home/data/network/model/playlist_model/album_model_db.dart';
import 'package:music_app/features/home/data/network/model/search_model/artist_model_db.dart';

class Data {
  final int id;
  final bool readable;
  final String title;
  final String titleShort;
  final String link;
  final int duration;
  final int rank;
  final bool explicitLyrics;
  final int explicitContentLyrics;
  final int explicitContentCover;
  final String preview;
  final String md5Image;
  final Artist artist;
  final Album album;

  final String titleVersion;

  Data({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.album,
    required this.titleVersion,
  });

  Data copyWith({
    int? id,
    bool? readable,
    String? title,
    String? titleShort,
    String? link,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    Artist? artist,
    Album? album,
    String? titleVersion,
  }) =>
      Data(
        id: id ?? this.id,
        readable: readable ?? this.readable,
        title: title ?? this.title,
        titleShort: titleShort ?? this.titleShort,
        link: link ?? this.link,
        duration: duration ?? this.duration,
        rank: rank ?? this.rank,
        explicitLyrics: explicitLyrics ?? this.explicitLyrics,
        explicitContentLyrics:
            explicitContentLyrics ?? this.explicitContentLyrics,
        explicitContentCover: explicitContentCover ?? this.explicitContentCover,
        preview: preview ?? this.preview,
        md5Image: md5Image ?? this.md5Image,
        artist: artist ?? this.artist,
        album: album ?? this.album,
        titleVersion: titleVersion ?? this.titleVersion,
      );

  factory Data.fromJson(Map<String, dynamic> json) {
    try {
      return Data(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        titleVersion: json["title_version"] ?? '',
      );
    } catch (e) {
      throw Exception('Error parsing Data');
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "artist": artist.toJson(),
        "album": album.toJson(),
        "title_version": titleVersion,
      };
}
