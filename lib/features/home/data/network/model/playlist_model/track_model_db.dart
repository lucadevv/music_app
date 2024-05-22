import 'package:music_app/features/home/data/network/model/playlist_model/song_model.dart';

class Tracks {
  final List<SongModel> data;
  final String checksum;

  Tracks({
    required this.data,
    required this.checksum,
  });

  Tracks copyWith({
    List<SongModel>? data,
    String? checksum,
  }) =>
      Tracks(
        data: data ?? this.data,
        checksum: checksum ?? this.checksum,
      );

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        data: List<SongModel>.from(
            json["data"].map((x) => SongModel.fromJson(x))),
        checksum: json["checksum"] ?? "no-checksum",
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "checksum": checksum,
      };
}
