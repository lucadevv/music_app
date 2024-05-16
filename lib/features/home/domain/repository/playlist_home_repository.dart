import 'package:music_app/features/home/domain/entites/playlist_home_entity.dart';

abstract class PlayListHomeRepository {
  Future<List<PlayListHomeEntity>> fetchPlayListHome();
}
