import 'package:get/get.dart';
import 'package:ird_hadith/domain/entities/hadith.dart';
import 'package:ird_hadith/domain/usecases/get_hadith_list.dart';

class HadithDetailsController extends GetxController {
  final GetHadithListUseCase _getHadithListUseCase;

  HadithDetailsController(this._getHadithListUseCase);

  RxList<Hadith> hadithList = <Hadith>[].obs;

  @override
  void onInit() {
    _fetchHadithList();
    super.onInit();
  }

  void _fetchHadithList() async {
    try {
      final hadithData = await _getHadithListUseCase.execute();
      hadithList.value = hadithData;
    } catch (e) {
      print("Error fetching Hadith details: $e");
    }
  }
}
