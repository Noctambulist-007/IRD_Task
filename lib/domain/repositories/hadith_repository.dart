import 'package:ird_hadith/domain/entities/hadith.dart';

abstract class HadithRepository {
  Future<List<Hadith>> getAllHadith();
}
