import 'package:music_app/features/home/domain/entites/recent_entity/recent_home_entity.dart';

abstract class PlayListHomeRepository {
  Future<List<RecentListHomeEntity>> fetchPlayListHome();
}
