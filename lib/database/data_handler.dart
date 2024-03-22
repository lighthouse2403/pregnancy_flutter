import 'package:flutter/foundation.dart';
import 'package:pregnancy_flutter/diary/model/diary.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHandler {
  static String databasePath = 'pregnancy.db';

  static Future<sql.Database> db(String tableName) async {
    return sql.openDatabase(
      DatabaseHandler.databasePath,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("CREATE TABLE diaries(id TEXT PRIMARY KEY, title TEXT, content TEXT, createdTime INTEGER, updatedTime TEXT, mediaUrl TEXT)");
  }

  Future<void> insertDiary(Diary diary, String tableName) async {
    // Get a reference to the database.
    final db = await DatabaseHandler.db(tableName);
    await db.insert(
      tableName,
      diary.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  // Read all items (journals)
  static Future<Diary> getDiary(int id) async {
    const tableName = 'diaries';
    final db = await DatabaseHandler.db(tableName);
    final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Diary.fromDatabase(maps.first);
  }

  Future<List<Diary>> getDiaries() async {
    const tableName = 'diaries';
    final db = await DatabaseHandler.db(tableName);
    final List<Map<String, dynamic>> list = await db.query(tableName);
    return list.map((e) => Diary.fromDatabase(e)).toList();
  }

  // Update an item by id
  Future<void> updateDiary(Diary diary) async {
    const tableName = 'diaries';
    final db = await DatabaseHandler.db(tableName);

    await db.update(
      tableName,
      diary.toJson(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [diary.id],
    );
  }

  // Delete
  static Future<void> deleteDiary(int id) async {
    const tableName = 'diaries';
    final db = await DatabaseHandler.db(tableName);
    try {
      await db.delete(
          tableName,
          where: "id = ?",
          whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> deleteAllDiary(int diaryId) async {
    const tableName = 'diaries';
    final db = await DatabaseHandler.db(tableName);
    try {
      await db.delete(
          tableName,
          where: "id = ?",
          whereArgs: [diaryId]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> clearData() async {
    sql.deleteDatabase(DatabaseHandler.databasePath);
  }
}