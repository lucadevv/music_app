import 'package:music_app/features/artist/data/network/models/artist/artist_response_db_model.dart';

class ArtistEntity {
  final int id;
  final String name;
  final String link;
  final String imageMedium;
  final String imageBig;
  final int numFan;

  ArtistEntity(
      {required this.id,
      required this.name,
      required this.link,
      required this.imageMedium,
      required this.imageBig,
      required this.numFan});
  factory ArtistEntity.fromArtistResponseDbModel(ArtistResponseDbModel md) {
    return ArtistEntity(
      id: md.id,
      name: md.name,
      link: md.link,
      imageMedium: md.pictureMedium,
      imageBig: md.pictureBig,
      numFan: md.nbFan,
    );
  }
  factory ArtistEntity.empty() {
    return ArtistEntity(
      id: -1,
      name: "",
      link: "",
      imageMedium: "",
      imageBig: "",
      numFan: 0,
    );
  }
}
