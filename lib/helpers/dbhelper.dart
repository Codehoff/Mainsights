import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'flashcards.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE flashcards(id TEXT PRIMARY KEY, question TEXT UNIQUE, answer TEXT, category TEXT, subcategory TEXT, complexity TEXT, points INTEGER, viewed TEXT, lastReviewed TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> dropDB() async {
    final db = await DBHelper.database();
    await db.rawQuery("DROP table flashcards");
  }

  static Future<void> updateDB(id, editedFlashcard) async {
    final db = await DBHelper.database();
    db.rawQuery(
        'UPDATE flashcards SET points = ${editedFlashcard.points}, lastReviewed = "${editedFlashcard.lastReviewed}" WHERE id = "$id";');
  }

  static Future<void> setFlashcardAsViewed(id, editedFlashcard) async {
    final db = await DBHelper.database();
    db.rawQuery(
        'UPDATE flashcards SET viewed = "Has been viewed", lastReviewed = "${editedFlashcard.lastReviewed}" WHERE id = "$id";');
  }
}
