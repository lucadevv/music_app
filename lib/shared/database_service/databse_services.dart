import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  DatabaseService._internal();
  static DatabaseService get instance => _instance;

  Database? _db;
  Database get db {
    if (_db == null) {
      throw Exception("Database not initialized");
    }
    return _db!;
  }

  Future<void> init() async {
    if (_db != null) return;
    _db = await openDatabase(
      "download_music.db",
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE music (
          id INTEGER PRIMARY KEY,
          title TEXT,
          duration INTEGER,
          url TEXT,
          imagePath TEXT
        )
        ''');
        db.execute('''
        CREATE TABLE artist (
          id INTEGER PRIMARY KEY,
          name TEXT,
          idMusic INTEGER,
          FOREIGN KEY(idMusic) REFERENCES music(id)
        )
      ''');
      },
    );
  }
}
