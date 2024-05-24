import 'package:music_app/features/home/domain/entites/favority_entity/your_favorite_music_entity.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';

abstract class FavoriteMusicRepository {
  Future<void> addFavoriteMusic({required YourFavoriteMusicEntity model});
  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic();
  Future<void> removeFavorite({required int id});
}
