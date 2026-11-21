/// A canonical hadith collection.
class HadithBook {
  const HadithBook({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.author,
    required this.description,
    required this.tag,
    required this.sectionCount,
    required this.hadithCount,
    this.isHero = false,
  });

  final int number;
  final String name;
  final String arabicName;
  final String author;
  final String description;

  /// Grading / category chip label.
  final String tag;

  /// e.g. "56 Chapters" or "43 Books".
  final String sectionCount;
  final String hadithCount;
  final bool isHero;
}
