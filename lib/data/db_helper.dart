import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'hadith_db.db');

    if (!await databaseExists(path)) {
      try {
        ByteData data = await rootBundle.load('assets/database/hadith_db.db');
        List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        print("Error copying database: $e");
        throw Exception("Error copying database: $e");
      }
    }

    try {
      return await openDatabase(path, readOnly: true);
    } catch (e) {
      print("Error opening database: $e");
      throw Exception("Error opening database: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> getAllHadith() async {
    final db = await database;
    try {
      var res = await db.rawQuery('''
      SELECT 
        hadith.hadith_id,
        hadith.book_id,
        hadith.book_name,
        hadith.chapter_id,
        hadith.section_id,
        hadith.narrator,
        hadith.bn,
        hadith.ar,
        hadith.ar_diacless,
        hadith.note,
        hadith.grade_id,
        hadith.grade,
        hadith.grade_color,
        books.title AS book_title,
        chapter.title AS chapter_title,
        chapter.number AS chapter_number,
        chapter.hadis_range AS hadith_range,
        section.title AS section_title,
        section.preface AS section_preface,
        section.number AS hadith_number
      FROM hadith
      LEFT JOIN books ON hadith.book_id = books.id
      LEFT JOIN chapter ON hadith.chapter_id = chapter.id
      LEFT JOIN section ON hadith.section_id = section.id
      ORDER BY hadith.book_id ASC, hadith.chapter_id ASC, hadith.section_id ASC
    ''');
      return res;
    } catch (e) {
      print("Error querying database: $e");
      throw Exception("Error querying database: $e");
    }
  }
}