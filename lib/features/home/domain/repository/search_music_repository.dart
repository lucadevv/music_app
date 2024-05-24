import 'package:music_app/features/home/domain/entites/search_entity/search_home_search_entity.dart';

abstract class SearchMusicRepository {
  Stream<List<SearchHomeEntity>> searchMusic({required String request});
}
