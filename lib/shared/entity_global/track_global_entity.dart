import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_tracks_entity.dart';
import 'package:music_app/features/home/domain/entites/favority_entity/your_favorite_music_entity.dart';
import 'package:music_app/features/home/domain/entites/search_entity/search_home_search_entity.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';
import 'package:music_app/shared/entity_global/artist_gobal_entity.dart';

class TrackGloablEntity {
  final int id;
  final String title;
  final int duration;
  final String urlMp3;
  final String imagePath;
  final ArtistGlobalEntity artistGlobalEntity;

  const TrackGloablEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.urlMp3,
    required this.imagePath,
    required this.artistGlobalEntity,
  });

  factory TrackGloablEntity.empty() {
    return TrackGloablEntity(
      id: -1,
      title: "",
      duration: 0,
      urlMp3: "",
      imagePath: "",
      artistGlobalEntity: ArtistGlobalEntity.empty(),
    );
  }
  factory TrackGloablEntity.trackEntity(TrackEntity entity) {
    return TrackGloablEntity(
      id: entity.id,
      title: entity.title,
      duration: entity.duration,
      urlMp3: entity.urlMp3,
      imagePath: entity.imagePath,
      artistGlobalEntity: ArtistGlobalEntity(
        id: -1,
        name: entity.author,
        trackList: "",
      ),
    );
  }

  factory TrackGloablEntity.yourFavoriteEntity(YourFavoriteMusicEntity et) {
    return TrackGloablEntity(
      id: et.id,
      title: et.title,
      duration: et.duration,
      urlMp3: et.urlMp3,
      imagePath: et.imagePath,
      artistGlobalEntity: ArtistGlobalEntity(
        id: et.artistGlobalEntity.id,
        name: et.artistGlobalEntity.name,
        trackList: et.artistGlobalEntity.trackList,
      ),
    );
  }
  factory TrackGloablEntity.searchEntity(SearchHomeEntity et) {
    return TrackGloablEntity(
      id: et.id,
      title: et.titleShort,
      duration: et.duration,
      urlMp3: et.urlMp3,
      imagePath: et.album.imagePathMedium,
      artistGlobalEntity: ArtistGlobalEntity.artisHomeEntity(et.artist),
    );
  }
  factory TrackGloablEntity.fromArtisTrackEntity(ArtistTracksEntity et) {
    return TrackGloablEntity(
      id: et.id,
      title: et.title,
      duration: et.duration,
      urlMp3: et.urlMp3,
      imagePath: et.album.imagePath,
      artistGlobalEntity: ArtistGlobalEntity.artistArtistEntity(et.artist),
    );
  }
  factory TrackGloablEntity.fromMusicLocalDb(MusicLocalDb md) {
    return TrackGloablEntity(
      id: md.id,
      title: md.title,
      duration: md.duration,
      urlMp3: md.urlPath,
      imagePath: md.imagePath,
      artistGlobalEntity:
          ArtistGlobalEntity(id: -1, name: md.artist, trackList: ""),
    );
  }
}
