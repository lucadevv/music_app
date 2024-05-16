import 'package:music_app/features/home/data/network/model/creator_model_db.dart';
import 'package:music_app/features/home/data/network/model/track_model_db.dart';

class PlayListModelDb {
  final int id;
  final String title;
  final String description;
  final int duration;
  final bool public;
  final bool isLovedTrack;
  final bool collaborative;
  final int nbTracks;
  final int fans;
  final String link;
  final String share;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final String checksum;
  final String tracklist;
  final DateTime creationDate;
  final String md5Image;
  final String pictureType;
  final Creator creator;
  final String type;
  final Tracks tracks;

  PlayListModelDb({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.public,
    required this.isLovedTrack,
    required this.collaborative,
    required this.nbTracks,
    required this.fans,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.checksum,
    required this.tracklist,
    required this.creationDate,
    required this.md5Image,
    required this.pictureType,
    required this.creator,
    required this.type,
    required this.tracks,
  });

  PlayListModelDb copyWith({
    int? id,
    String? title,
    String? description,
    int? duration,
    bool? public,
    bool? isLovedTrack,
    bool? collaborative,
    int? nbTracks,
    int? fans,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? checksum,
    String? tracklist,
    DateTime? creationDate,
    String? md5Image,
    String? pictureType,
    Creator? creator,
    String? type,
    Tracks? tracks,
  }) =>
      PlayListModelDb(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        public: public ?? this.public,
        isLovedTrack: isLovedTrack ?? this.isLovedTrack,
        collaborative: collaborative ?? this.collaborative,
        nbTracks: nbTracks ?? this.nbTracks,
        fans: fans ?? this.fans,
        link: link ?? this.link,
        share: share ?? this.share,
        picture: picture ?? this.picture,
        pictureSmall: pictureSmall ?? this.pictureSmall,
        pictureMedium: pictureMedium ?? this.pictureMedium,
        pictureBig: pictureBig ?? this.pictureBig,
        pictureXl: pictureXl ?? this.pictureXl,
        checksum: checksum ?? this.checksum,
        tracklist: tracklist ?? this.tracklist,
        creationDate: creationDate ?? this.creationDate,
        md5Image: md5Image ?? this.md5Image,
        pictureType: pictureType ?? this.pictureType,
        creator: creator ?? this.creator,
        type: type ?? this.type,
        tracks: tracks ?? this.tracks,
      );

  factory PlayListModelDb.fromJson(Map<String, dynamic> json) =>
      PlayListModelDb(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        public: json["public"],
        isLovedTrack: json["is_loved_track"],
        collaborative: json["collaborative"],
        nbTracks: json["nb_tracks"],
        fans: json["fans"],
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        checksum: json["checksum"],
        tracklist: json["tracklist"],
        creationDate: DateTime.parse(json["creation_date"]),
        md5Image: json["md5_image"],
        pictureType: json["picture_type"],
        creator: Creator.fromJson(json["creator"]),
        type: json["type"],
        tracks: Tracks.fromJson(json["tracks"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "public": public,
        "is_loved_track": isLovedTrack,
        "collaborative": collaborative,
        "nb_tracks": nbTracks,
        "fans": fans,
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "checksum": checksum,
        "tracklist": tracklist,
        "creation_date": creationDate.toIso8601String(),
        "md5_image": md5Image,
        "picture_type": pictureType,
        "creator": creator.toJson(),
        "type": type,
        "tracks": tracks.toJson(),
      };
}
