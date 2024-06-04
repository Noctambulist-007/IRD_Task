import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ird_hadith/domain/entities/hadith.dart';
import 'package:ird_hadith/presentation/utils/utils.dart';

class HadithItem extends StatelessWidget {
  final Hadith hadith;
  final int hadithNumber;

  HadithItem({
    required this.hadith,
    required this.hadithNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 100,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 20,
                                  child: SvgPicture.asset(
                                    'assets/icons/noun-hexagon.svg',
                                    width: 50,
                                    height: 80,
                                    color: Color(0xff76BF6B),
                                  ),
                                ),
                                const Positioned(
                                  top: 35,
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hadith.bookTitle,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kalpurush'),
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            'হাদিস: ${arabicToBengali(hadithNumber)}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff118C6F),
                                fontFamily: 'Kalpurush'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff45B891),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(16.0),
                            right: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          child: Text(
                            hadith.grade,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kalpurush',
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Text(
                hadith.ar,
                style: const TextStyle(fontFamily: 'KFGQ', fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                '${hadith.narrator} থেকে বর্ণিত:',
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Kalpurush',
                    color: Color(0xff118C6F)),
              ),
              const SizedBox(height: 10),
              Text(
                hadith.bn,
                style: const TextStyle(fontFamily: 'Kalpurush', fontSize: 18),
              ),
              const SizedBox(height: 10),
              if (hadith.note != null && hadith.note!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    const Text(
                      'ফুটনোট:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Kalpurush'),
                    ),
                    Text(
                      '${hadith.note}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Kalpurush'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
