import 'package:music_app/features/artist/data/network/models/list_track_artist/artist_db_model.dart';

class ArtisArtisEntity {
  final int id;
  final String name;
  final String trackList;

  ArtisArtisEntity({
    required this.id,
    required this.name,
    required this.trackList,
  });

  factory ArtisArtisEntity.fromArtistModel(ArtistDbModel md) {
    return ArtisArtisEntity(
      id: md.id,
      name: md.name,
      trackList: md.tracklist,
    );
  }
  factory ArtisArtisEntity.empty() {
    return ArtisArtisEntity(
      id: -1,
      name: "",
      trackList: "",
    );
  }
}
