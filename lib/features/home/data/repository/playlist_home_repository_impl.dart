import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/domain/entites/recent_entity/recent_home_entity.dart';
import 'package:music_app/features/home/domain/repository/playlist_home_repository.dart';

class PlayListHomeRepositoryImpl extends PlayListHomeRepository {
  final DatasourceNtwBdHome datasourceNtwBdHome;

  PlayListHomeRepositoryImpl({
    required this.datasourceNtwBdHome,
  });
  @override
  Future<List<RecentListHomeEntity>> fetchPlayListHome() async {
    final response = await datasourceNtwBdHome.fetchPlayList();
    final dataMap = response.map((e) {
      return RecentListHomeEntity.fromModelDb(e);
    }).toList();
    return dataMap;
  }
}
