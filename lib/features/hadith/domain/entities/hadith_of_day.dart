/// The "Hadith of the Day" spotlight.
class HadithOfDay {
  const HadithOfDay({
    required this.arabic,
    required this.translation,
    required this.narrator,
    required this.narratorArabic,
    required this.source,
    required this.reference,
    required this.grade,
  });

  final String arabic;
  final String translation;
  final String narrator;
  final String narratorArabic;
  final String source;
  final String reference;
  final String grade;
}
