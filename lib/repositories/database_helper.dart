import 'dart:io';

import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String _dbName = "d_day.db";
  static final int _dbVersion = 1;
  static Database _database;
  static final String _tableName = "d_day";

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initialDatabase();
    }
    return _database;
  }

  // 싱글톤
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  _initialDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    print(path);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreatingDatabase);
  }

  Future _onCreatingDatabase(Database database, int version) async {
    database.execute("""
    CREATE TABLE $_tableName
      (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        datetime TEXT  NOT NULL,
        type TEXT NOT NULL
      )
    """);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database database = await instance.database;
    return await database.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    Database database = await instance.database;
    return database.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database database = await instance.database;
    return await database
        .update(_tableName, row, where: "id = ?", whereArgs: [row["id"]]);
  }

  Future delete(int id) async {
    Database database = await instance.database;
    return await database.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }
}
