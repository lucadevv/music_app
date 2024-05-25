import 'package:music_app/features/artist/data/network/models/list_track_artist/track_db_model.dart';

class ArtistDbResponseModel {
  final List<ArtisTrackDb> trackDb;
  final int total;
  final String next;

  ArtistDbResponseModel({
    required this.trackDb,
    required this.total,
    required this.next,
  });

  ArtistDbResponseModel copyWith({
    List<ArtisTrackDb>? trackDb,
    int? total,
    String? next,
  }) =>
      ArtistDbResponseModel(
        trackDb: trackDb ?? this.trackDb,
        total: total ?? this.total,
        next: next ?? this.next,
      );

  factory ArtistDbResponseModel.fromJson(Map<String, dynamic> json) =>
      ArtistDbResponseModel(
        trackDb: List<ArtisTrackDb>.from(
            json["data"].map((x) => ArtisTrackDb.fromJson(x))),
        total: json["total"] ?? 0,
        next: json["next"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "trackDb": List<dynamic>.from(trackDb.map((x) => x.toJson())),
        "total": total,
        "next": next,
      };
}
