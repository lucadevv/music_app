import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_artist_entity.dart';
import 'package:music_app/features/home/domain/entites/search_entity/artist_home_search_entity.dart';

class ArtistGlobalEntity {
  final int id;
  final String name;
  final String trackList;

  ArtistGlobalEntity({
    required this.id,
    required this.name,
    required this.trackList,
  });

  factory ArtistGlobalEntity.empty() {
    return ArtistGlobalEntity(
      id: -1,
      name: "",
      trackList: "",
    );
  }
  factory ArtistGlobalEntity.artisHomeEntity(ArtistHomeEntity et) {
    return ArtistGlobalEntity(
      id: et.id,
      name: et.name,
      trackList: et.trackList,
    );
  }
  factory ArtistGlobalEntity.artistArtistEntity(ArtisArtisEntity et) {
    return ArtistGlobalEntity(
      id: et.id,
      name: et.name,
      trackList: et.trackList,
    );
  }
}
