import 'package:music_app/shared/database_service/databse_services.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';
import 'package:sqflite/sqflite.dart';

class MusicDao {
  final database = DatabaseService.instance.db;

  Future<List<MusicLocalDb>> getAllMusic() async {
    final response = await database.query("music");
    final map = response.map((e) {
      return MusicLocalDb.fromMapDb(e);
    }).toList();
    return map;
  }

  Future<int> insertMusic(MusicLocalDb music) async {
    try {
      return await database.insert(
        "music",
        {
          "id": music.id,
          "title": music.title,
          "duration": music.duration,
          "url": music.urlPath,
          "imagePath": music.imagePath,
          "artist": music.artist,
          "artistId": music.artistId,
          "artistList": music.artistList
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(MusicLocalDb music) async {
    await database
        .update("music", music.toMap(), where: "id : ?", whereArgs: [music.id]);
  }

  Future<void> delete(MusicLocalDb music) async {
    await database.delete("music", where: "id : ?", whereArgs: [music.id]);
  }
}
