import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionTitle;
  final String? sectionPreface;
  final bool isFirstSection;

  SectionHeader({
    required this.sectionTitle,
    this.sectionPreface,
    required this.isFirstSection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isFirstSection)
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Kalpurush',
                        color: Colors.black54,
                      ),
                      children: [
                        const TextSpan(
                          text: '১/১. অধ্যায়ঃ ',
                          style: TextStyle(
                            color: Color(0xff118C6F),
                          ),
                        ),
                        TextSpan(
                          text: sectionTitle,
                        ),
                      ],
                    ),
                  )
                else
                  Text(
                    sectionTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff118C6F),
                        fontSize: 20,
                        fontFamily: 'Kalpurush'),
                  ),
                const SizedBox(height: 5),
                if (sectionPreface != null && sectionPreface!.isNotEmpty)
                  Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$sectionPreface',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Kalpurush'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
