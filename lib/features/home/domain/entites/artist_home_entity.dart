import 'package:music_app/features/home/data/network/model/search_model/artist_model_db.dart';

class ArtistHomeEntity {
  final int id;
  final String name;
  final String url;
  final String imagePathSmall;
  final String imagePathMedium;
  final String trackList;

  ArtistHomeEntity(
      {required this.id,
      required this.name,
      required this.url,
      required this.imagePathSmall,
      required this.imagePathMedium,
      required this.trackList});

  factory ArtistHomeEntity.fromModel(Artist db) => ArtistHomeEntity(
        id: db.id,
        name: db.name,
        url: db.link,
        imagePathSmall: db.pictureSmall,
        imagePathMedium: db.pictureMedium,
        trackList: db.tracklist,
      );

  factory ArtistHomeEntity.empty() {
    return ArtistHomeEntity(
      id: -1,
      name: "",
      url: "",
      imagePathSmall: "",
      imagePathMedium: "",
      trackList: "",
    );
  }
}
