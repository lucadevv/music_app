import 'package:music_app/features/artist/data/network/datasource_artist_ntw/datasource_artist_ntw.dart';
import 'package:music_app/features/artist/domain/entities/artist/artist_entity.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_tracks_entity.dart';
import 'package:music_app/features/artist/domain/rositories/artist_repository.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  final DatasourceArtistNtw datasourceArtistNtw;

  ArtistRepositoryImpl({required this.datasourceArtistNtw});
  @override
  Future<List<ArtistTracksEntity>> fetchAllTracksArtist(
      {required String url}) async {
    final response = await datasourceArtistNtw.fetchDataArtist(url: url);
    final list = response.trackDb.map((e) {
      return ArtistTracksEntity.fromArtisTrackModel(e);
    }).toList();
    return list;
  }

  @override
  Future<ArtistEntity> fetchArtist({required int id}) async {
    final response = await datasourceArtistNtw.fetchArtistDb(id: id);

    final model = ArtistEntity.fromArtistResponseDbModel(response);

    return model;
  }
}
