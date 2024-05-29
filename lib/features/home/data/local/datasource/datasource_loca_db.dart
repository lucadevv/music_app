import 'package:dio/dio.dart';
import 'package:music_app/shared/database_service/dao/music_dao.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatasourceLocalDb {
  final musicDao = MusicDao();
  final dio = Dio();

  Future<List<MusicLocalDb>> getAllMusicDownload() async {
    final response = await musicDao.getAllMusic();

    return response;
  }

  Future<void> inserMusic({required MusicLocalDb music}) async {
    try {
      final String nameFileUpdate = "${music.title.replaceAll(' ', '_')}.mp3";
      final String nameImageFileUpdate =
          "${music.title.replaceAll(' ', '_')}.jpg";
      final dir = await getApplicationDocumentsDirectory();
      final filePath = join(dir.path, nameFileUpdate);
      final fileImagePath = join(dir.path, nameImageFileUpdate);
      await dio.download(music.urlPath, filePath);
      await dio.download(music.imagePath, fileImagePath);
      await musicDao.insertMusic(
          music.copyWith(urlPath: filePath, imagePath: fileImagePath));
    } catch (e) {
      throw Exception(e);
    }
  }
}
