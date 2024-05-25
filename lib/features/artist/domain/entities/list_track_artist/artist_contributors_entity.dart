import 'package:music_app/features/artist/data/network/models/list_track_artist/contributor_db_model.dart';

class ArtisContributorsEntity {
  final int id;
  final String name;
  final String url;
  final String image;
  final String trackList;

  ArtisContributorsEntity(
      {required this.id,
      required this.name,
      required this.url,
      required this.image,
      required this.trackList});

  factory ArtisContributorsEntity.fromContributorModel(ContributorDbModel md) {
    return ArtisContributorsEntity(
      id: md.id,
      name: md.name,
      url: md.link,
      image: md.pictureMedium,
      trackList: md.tracklist,
    );
  }
}
