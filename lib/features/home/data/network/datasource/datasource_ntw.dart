import 'package:dio/dio.dart';
import 'package:music_app/features/home/data/network/model/playlist_model_db.dart';
import 'package:music_app/features/home/domain/entites/playlist_home_entity.dart';

class DatasourceNtwBdHome {
  final dio = Dio();

  Future<List<PlayListModelDb>> fetchPlayList() async {
    final response = await dio.get("https://api.deezer.com/playlist/908622995");
    Map<String, dynamic> responseMap = response.data;
    try {
      final list = PlayListModelDb.fromJson(responseMap);
      print(list);
    } catch (e) {
      print(e);
    }

    return [];
  }
}
