import 'package:dio/dio.dart';
import 'package:music_app/features/home/data/network/model/playlist_model_db.dart';

class DatasourceNtwBdHome {
  final dio = Dio();

  Future<List<PlayListModelDb>> fetchPlayList() async {
    try {
      final response =
          await dio.get("https://api.deezer.com/playlist/908622995");
      Map<String, dynamic> responseMap = response.data;
      final List<PlayListModelDb> modelList = [];
      final model = PlayListModelDb.fromJson(responseMap);
      modelList.add(model);
      return modelList;
    } catch (e) {
      return [];
    }
  }
}
