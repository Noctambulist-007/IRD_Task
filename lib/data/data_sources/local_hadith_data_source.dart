import 'package:sqflite/sqflite.dart';
import 'package:ird_hadith/data/models/hadith_model.dart';

abstract class LocalHadithDataSource {
  Future<List<HadithModel>> getAllHadith();
}

class LocalHadithDataSourceImpl implements LocalHadithDataSource {
  final Database _database;

  LocalHadithDataSourceImpl(this._database);

  @override
  Future<List<HadithModel>> getAllHadith() async {
    try {
      var res = await _database.rawQuery('''
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
      return res.map((data) => HadithModel.fromMap(data)).toList();
    } catch (e) {
      print("Error querying database: $e");
      throw Exception("Error querying database: $e");
    }
  }
}
