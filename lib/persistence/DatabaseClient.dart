import 'dart:io';

import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/utils/Constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Database _db;
  HomeListEntity _entity;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, Constants.DB_NAME);
    _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute("""
    CREATE TABLE ${Constants.TABLE_FAVORITE}(id integer primary key autoincrement,tv_id TEXT,title TEXT,zhuti TEXT,img TEXT)
    """);
  }

  // Define a function that inserts dogs into the database
  Future<void> insertHomeListEntity(HomeListEntity entity) async {
    // Get a reference to the database.
    final Database db = await _db;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      Constants.TABLE_FAVORITE,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HomeListEntity>> fetchAllFavorites() async {
    // Get a reference to the database.
    final Database db = await _db;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(Constants.TABLE_FAVORITE);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return HomeListEntity(
        maps[i]['tv_id'],
        maps[i]['title'],
        maps[i]['zhuti'],
        maps[i]['img']
      );
    });
  }

}