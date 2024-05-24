import 'package:music_app/features/home/domain/entites/favority_entity/your_favorite_music_entity.dart';

class DatasourceMemorydbHome {
  Future<void> addFavoriteMusic(
      {required YourFavoriteMusicEntity model}) async {
    if (!musicProvider.contains(model)) {
      musicProvider.add(model);
    } else {}

    print("datasource ${musicProvider.length}");
  }

  Future<void> remodeTrack({required int id}) async {
    try {
      musicProvider.removeWhere((element) => element.id == id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic() async {
    return musicProvider;
  }
}

final List<YourFavoriteMusicEntity> musicProvider = [];
