import 'package:dio/dio.dart';
import 'package:music_app/features/home/data/network/model/playlist_model/playlist_model_db.dart';

class DatasourcePlayListNtwDb {
  final dio = Dio();

  Future<PlayListModelDb> fetPlayList() async {
    try {
      final response =
          await dio.get("https://api.deezer.com/playlist/908622995");
      Map<String, dynamic> responseMap = response.data;
      final model = PlayListModelDb.fromJson(responseMap);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch playlist: $e');
    }
  }
}
