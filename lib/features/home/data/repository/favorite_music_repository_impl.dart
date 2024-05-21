import 'package:music_app/features/home/data/memory/datasource_memorydb_home.dart';
import 'package:music_app/features/home/domain/entites/your_favorite_music_entity.dart';
import 'package:music_app/features/home/domain/repository/favorite_music_repository.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';

class FavoriteMusicRepositoryImpl extends FavoriteMusicRepository {
  final DatasourceMemorydbHome datasourceMemorydbHome;

  FavoriteMusicRepositoryImpl({required this.datasourceMemorydbHome});
  @override
  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic() {
    return datasourceMemorydbHome.fetchAllFavoriteMusic();
  }

  @override
  Future<void> addFavoriteMusic(
      {required YourFavoriteMusicEntity model}) async {
    datasourceMemorydbHome.addFavoriteMusic(model: model);
  }

  @override
  Future<void> removeFavorite({required TrackEntity model}) async {
    await datasourceMemorydbHome.remodeTrack(model: model);
  }
}
