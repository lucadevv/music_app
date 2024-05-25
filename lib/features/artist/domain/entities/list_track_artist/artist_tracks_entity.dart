import 'package:music_app/features/artist/data/network/models/list_track_artist/track_db_model.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_album_entity.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_artist_entity.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_contributors_entity.dart';

class ArtistTracksEntity {
  final int id;
  final String title;
  final String urlMp3;
  final int duration;
  final String url;
  final List<ArtisContributorsEntity> contributors;
  final ArtisArtisEntity artist;
  final ArtistAlbumEntity album;

  ArtistTracksEntity({
    required this.id,
    required this.title,
    required this.urlMp3,
    required this.url,
    required this.contributors,
    required this.artist,
    required this.album,
    required this.duration,
  });

  factory ArtistTracksEntity.fromArtisTrackModel(ArtisTrackDb md) {
    return ArtistTracksEntity(
      id: md.id,
      title: md.title,
      urlMp3: md.preview,
      url: md.link,
      contributors: md.contributors.map((e) {
        return ArtisContributorsEntity.fromContributorModel(e);
      }).toList(),
      artist: ArtisArtisEntity.fromArtistModel(md.artist),
      album: ArtistAlbumEntity.fromAlbumModel(md.album),
      duration: md.duration,
    );
  }
  factory ArtistTracksEntity.empty() {
    return ArtistTracksEntity(
      id: -1,
      title: "",
      urlMp3: "",
      url: "",
      contributors: [],
      artist: ArtisArtisEntity.empty(),
      album: ArtistAlbumEntity.empty(),
      duration: 0,
    );
  }
}
