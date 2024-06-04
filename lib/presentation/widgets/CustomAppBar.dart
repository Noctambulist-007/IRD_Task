import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final String bookTitle;
  final String chapterTitle;

  CustomAppBar({
    required this.bookTitle,
    required this.chapterTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 70,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      backgroundColor: const Color(0xff118C6F),
      leading: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookTitle,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Kalpurush',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            chapterTitle,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Kalpurush', color: Colors.white),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            'assets/icons/setting-slider-square.svg',
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        ),
      ],
      floating: true,
      snap: true,
    );
  }
}
