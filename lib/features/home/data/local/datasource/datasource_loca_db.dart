import 'package:music_app/shared/database_service/dao/music_dao.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';

class DatasourceLocalDb {
  final musicDao = MusicDao();

  Future<List<MusicLocalDb>> getAllMusicDownload() async {
    final response = await musicDao.getAllMusic();
    return response;
  }

  Future<void> inserMusic({required MusicLocalDb music}) async {
    await musicDao.insertMusic(music);
  }
}
