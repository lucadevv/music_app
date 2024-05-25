import 'package:music_app/features/artist/domain/entities/artist/artist_entity.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_tracks_entity.dart';

abstract class ArtistRepository {
  Future<List<ArtistTracksEntity>> fetchAllTracksArtist({required String url});
  Future<ArtistEntity> fetchArtist({required int id});
}
