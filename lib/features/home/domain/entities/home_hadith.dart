/// Hadith displayed in the "Hadith of the Day" card.
class HomeHadith {
  const HomeHadith({
    required this.arabicLines,
    required this.narrator,
    required this.translationLines,
    required this.source,
    required this.grade,
  });

  final List<String> arabicLines;
  final String narrator;
  final List<String> translationLines;
  final String source;
  final String grade;
}
