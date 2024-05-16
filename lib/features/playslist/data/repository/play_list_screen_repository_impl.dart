import 'package:music_app/features/playslist/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/playslist/domain/entities/playlist_entity.dart';
import 'package:music_app/features/playslist/domain/repositories/playlist_screen_repository.dart';

class PlayListScreenRepositorImpl extends PlaylistScreenRepository {
  final DatasourcePlayListNtwDb datasourcePlayListNtwDb;

  PlayListScreenRepositorImpl({required this.datasourcePlayListNtwDb});
  @override
  Future<PlayListEntity> fetPlayList() async {
    final response = await datasourcePlayListNtwDb.fetPlayList();
    final object = PlayListEntity.fromModelDb(response);
    return object;
  }
}
