import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_hadith/presentation/controllers/hadith_details_controller.dart';
import 'package:ird_hadith/presentation/widgets/CustomAppBar.dart';
import 'package:ird_hadith/presentation/widgets/HadithItem.dart';
import 'package:ird_hadith/presentation/widgets/SectionHeader.dart';

class HadithDetailsPage extends StatelessWidget {
  final HadithDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bookTitle: controller.hadithList.isNotEmpty
                ? controller.hadithList[0].bookTitle
                : '',
            chapterTitle: controller.hadithList.isNotEmpty
                ? controller.hadithList[0].chapterTitle
                : '',
          ),
          Obx(() {
            if (controller.hadithList.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text(
                    'হাদিস লোড করা হচ্ছে...',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Kalpurush',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff118C6F)),
                  ),
                ),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final hadith = controller.hadithList[index];

                    return Column(
                      children: [
                        SectionHeader(
                          sectionTitle: hadith.sectionTitle,
                          sectionPreface: hadith.sectionPreface,
                          isFirstSection: index == 0,
                        ),
                        HadithItem(
                          hadith: hadith,
                          hadithNumber: index + 1,
                        ),
                      ],
                    );
                  },
                  childCount: controller.hadithList.length,
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
