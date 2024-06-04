import 'package:ird_hadith/domain/entities/hadith.dart';
import 'package:ird_hadith/domain/repositories/hadith_repository.dart';

class GetHadithListUseCase {
  final HadithRepository _hadithRepository;

  GetHadithListUseCase(this._hadithRepository);

  Future<List<Hadith>> execute() async {
    return await _hadithRepository.getAllHadith();
  }
}
