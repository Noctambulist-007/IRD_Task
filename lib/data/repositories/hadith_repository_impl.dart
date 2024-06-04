import 'package:ird_hadith/data/data_sources/local_hadith_data_source.dart';
import 'package:ird_hadith/data/models/hadith_model.dart';
import 'package:ird_hadith/domain/entities/hadith.dart';
import 'package:ird_hadith/domain/repositories/hadith_repository.dart';
import 'package:sqflite/sqflite.dart';

class HadithRepositoryImpl implements HadithRepository {
  final LocalHadithDataSource _localDataSource;

  HadithRepositoryImpl(Database database)
      : _localDataSource = LocalHadithDataSourceImpl(database);

  @override
  Future<List<Hadith>> getAllHadith() async {
    final hadithModels = await _localDataSource.getAllHadith();
    return hadithModels.map((hadithModel) => hadithModel.toHadith()).toList();
  }
}

extension HadithModelExtensions on HadithModel {
  Hadith toHadith() {
    return Hadith(
      hadithId: hadithId,
      bookId: bookId,
      bookName: bookName,
      chapterId: chapterId,
      sectionId: sectionId,
      narrator: narrator,
      bn: bn,
      ar: ar,
      arDiacless: arDiacless,
      note: note,
      gradeId: gradeId,
      grade: grade,
      gradeColor: gradeColor,
      bookTitle: bookTitle,
      chapterTitle: chapterTitle,
      chapterNumber: chapterNumber,
      sectionTitle: sectionTitle,
      sectionPreface: sectionPreface,
      hadithNumber: hadithNumber,
      hadithRange: hadithRange,
    );
  }
}
