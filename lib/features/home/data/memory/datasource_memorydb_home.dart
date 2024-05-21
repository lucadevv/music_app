import 'package:music_app/features/home/domain/entites/your_favorite_music_entity.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';

class DatasourceMemorydbHome {
  Future<void> addFavoriteMusic(
      {required YourFavoriteMusicEntity model}) async {
    if (!musicProvider.contains(model)) {
      musicProvider.add(model);
    } else {}
  }

  Future<void> remodeTrack({required TrackEntity model}) async {
    try {
      musicProvider.removeWhere((element) => element.track.id == model.id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic() async {
    return musicProvider;
  }
}

final List<YourFavoriteMusicEntity> musicProvider = [];
