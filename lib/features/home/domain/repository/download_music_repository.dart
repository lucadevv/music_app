import 'package:music_app/shared/database_service/models/music_localdb.dart';

abstract class DownloadMusicRepository {
  Future<List<MusicLocalDb>> getAllMusicDownload();
  Future<void> insertMusic({required MusicLocalDb music});
}
