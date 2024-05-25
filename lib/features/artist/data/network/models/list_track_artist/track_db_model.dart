import 'package:music_app/features/artist/data/network/models/list_track_artist/album_db_model.dart';
import 'package:music_app/features/artist/data/network/models/list_track_artist/artist_db_model.dart';
import 'package:music_app/features/artist/data/network/models/list_track_artist/contributor_db_model.dart';

class ArtisTrackDb {
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
  final List<ContributorDbModel> contributors;
  final String md5Image;
  final ArtistDbModel artist;
  final AlbumDbModel album;
  final String type;

  ArtisTrackDb({
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
    required this.contributors,
    required this.md5Image,
    required this.artist,
    required this.album,
    required this.type,
  });

  ArtisTrackDb copyWith({
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
    List<ContributorDbModel>? contributors,
    String? md5Image,
    ArtistDbModel? artist,
    AlbumDbModel? album,
    String? type,
  }) =>
      ArtisTrackDb(
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
        contributors: contributors ?? this.contributors,
        md5Image: md5Image ?? this.md5Image,
        artist: artist ?? this.artist,
        album: album ?? this.album,
        type: type ?? this.type,
      );

  factory ArtisTrackDb.fromJson(Map<String, dynamic> json) => ArtisTrackDb(
        id: json["id"] ?? 0,
        readable: json["readable"],
        title: json["title"] ?? "no-title",
        titleShort: json["title_short"] ?? "no-title-short",
        titleVersion: json["title_version"] ?? "no-title-version",
        link: json["link"] ?? "no-link",
        duration: json["duration"] ?? 0,
        rank: json["rank"] ?? 0,
        explicitLyrics: json["explicit_lyrics"] ?? false,
        explicitContentLyrics: json["explicit_content_lyrics"] ?? 0,
        explicitContentCover: json["explicit_content_cover"] ?? 0,
        preview: json["preview"] ?? "no-preview",
        contributors: List<ContributorDbModel>.from(
            json["contributors"].map((x) => ContributorDbModel.fromJson(x))),
        md5Image: json["md5_image"],
        artist: ArtistDbModel.fromJson(json["artist"]),
        album: AlbumDbModel.fromJson(json["album"]),
        type: json['type'] ?? "no-type",
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
        "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
        "md5_image": md5Image,
        "artist": artist.toJson(),
        "album": album.toJson(),
        "type": type,
      };
}
