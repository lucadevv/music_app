import 'package:music_app/features/home/data/network/model/playlist_model/album_model_db.dart';

class AlbumHomeEntity {
  final int id;
  final String name;

  final String imagePathSmall;
  final String imagePathMedium;
  final String trackList;

  AlbumHomeEntity({
    required this.id,
    required this.name,
    required this.imagePathSmall,
    required this.imagePathMedium,
    required this.trackList,
  });

  factory AlbumHomeEntity.fromModel(Album al) => AlbumHomeEntity(
        id: al.id,
        name: al.title,
        imagePathSmall: al.coverSmall,
        imagePathMedium: al.coverMedium,
        trackList: al.tracklist,
      );

  factory AlbumHomeEntity.empty() {
    return AlbumHomeEntity(
      id: -1,
      name: "",
      imagePathSmall: "",
      imagePathMedium: "",
      trackList: "",
    );
  }
}
