class Hadith {
  final int hadithId;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String? note;
  final int gradeId;
  final String grade;
  final String gradeColor;
  final String bookTitle;
  final String chapterTitle;
  final int chapterNumber;
  final String sectionTitle;
  final String? sectionPreface;
  final int hadithNumber;
  final String hadithRange;

  Hadith({
    required this.hadithId,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    this.note,
    required this.gradeId,
    required this.grade,
    required this.gradeColor,
    required this.bookTitle,
    required this.chapterTitle,
    required this.chapterNumber,
    required this.sectionTitle,
    this.sectionPreface,
    required this.hadithNumber,
    required this.hadithRange,
  });
}
