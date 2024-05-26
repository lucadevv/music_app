import 'package:dio/dio.dart';
import 'package:music_app/features/home/data/local/datasource/datasource_loca_db.dart';
import 'package:music_app/features/home/domain/repository/download_music_repository.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';

class MusicDownloadRepositoryImp extends DownloadMusicRepository {
  final DatasourceLocalDb datasourceLocalDb;

  final dio = Dio();

  MusicDownloadRepositoryImp({required this.datasourceLocalDb});
  @override
  Future<List<MusicLocalDb>> getAllMusicDownload() async {
    return await datasourceLocalDb.getAllMusicDownload();
  }

  @override
  Future<void> insertMusic({required MusicLocalDb music}) async {
    await datasourceLocalDb.inserMusic(music: music);
  }
}
