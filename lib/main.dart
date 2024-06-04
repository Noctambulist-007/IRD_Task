import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_hadith/data/repositories/hadith_repository_impl.dart';
import 'package:ird_hadith/data/db_helper.dart';
import 'package:ird_hadith/domain/usecases/get_hadith_list.dart';
import 'package:ird_hadith/presentation/controllers/hadith_details_controller.dart';
import 'package:ird_hadith/presentation/pages/hadith_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await DBHelper.initDB();
  Get.put(HadithRepositoryImpl(db));

  Get.put(GetHadithListUseCase(Get.find<HadithRepositoryImpl>()));

  Get.put(HadithDetailsController(Get.find<GetHadithListUseCase>()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HadithDetailsPage(),
    );
  }
}
