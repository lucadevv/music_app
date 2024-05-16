import 'package:music_app/features/playslist/domain/entities/playlist_entity.dart';

abstract class PlaylistScreenRepository {
  Future<PlayListEntity> fetPlayList();
}
