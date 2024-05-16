import 'package:dio/dio.dart';
import 'package:music_app/features/home/data/network/model/playlist_model_db.dart';

class DatasourceNtwBdHome {
  final dio = Dio();

  Future<List<PlayListModelDb>> fetchPlayList() async {
    final response = await dio.get("https://api.deezer.com/playlist/908622995");
    final data = await response.data;

    return [];
  }
}
