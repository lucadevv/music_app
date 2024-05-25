import 'package:music_app/features/artist/data/network/models/list_track_artist/album_db_model.dart';

class ArtistAlbumEntity {
  final int id;
  final String title;
  final String imagePath;
  final String trackList;

  ArtistAlbumEntity(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.trackList});

  factory ArtistAlbumEntity.fromAlbumModel(AlbumDbModel md) {
    return ArtistAlbumEntity(
      id: md.id,
      title: md.title,
      imagePath: md.coverMedium,
      trackList: md.tracklist,
    );
  }
  factory ArtistAlbumEntity.empty() {
    return ArtistAlbumEntity(
      id: -1,
      title: "",
      imagePath: "",
      trackList: "",
    );
  }
}
