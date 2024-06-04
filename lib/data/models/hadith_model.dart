class HadithModel {
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

  HadithModel({
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

  factory HadithModel.fromMap(Map<String, dynamic> map) {
    return HadithModel(
      hadithId: map['hadith_id'] is int
          ? map['hadith_id']
          : int.tryParse(map['hadith_id'].toString()) ?? 0,
      bookId: map['book_id'] is int
          ? map['book_id']
          : int.tryParse(map['book_id'].toString()) ?? 0,
      bookName: map['book_name'] as String,
      chapterId: map['chapter_id'] is int
          ? map['chapter_id']
          : int.tryParse(map['chapter_id'].toString()) ?? 0,
      sectionId: map['section_id'] is int
          ? map['section_id']
          : int.tryParse(map['section_id'].toString()) ?? 0,
      narrator: map['narrator'] as String,
      bn: map['bn'] as String,
      ar: map['ar'] as String,
      arDiacless: map['ar_diacless'] as String,
      note: map['note'] as String?,
      gradeId: map['grade_id'] is int
          ? map['grade_id']
          : int.tryParse(map['grade_id'].toString()) ?? 0,
      grade: map['grade'] as String,
      gradeColor: map['grade_color'] as String,
      bookTitle: map['book_title'] as String,
      chapterTitle: map['chapter_title'] as String,
      chapterNumber: map['chapter_number'] is int
          ? map['chapter_number']
          : int.tryParse(map['chapter_number'].toString()) ?? 0,
      sectionTitle: map['section_title'] as String,
      sectionPreface: map['section_preface'] as String?,
      hadithNumber: map['hadith_number'] is int
          ? map['hadith_number']
          : int.tryParse(map['hadith_number'].toString()) ?? 0,
      hadithRange: map['hadith_range'] as String,
    );
  }
}
