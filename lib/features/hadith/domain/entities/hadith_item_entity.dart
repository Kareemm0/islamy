/// A single hadith entry within a collection.
class HadithItem {
  const HadithItem({
    required this.number,
    required this.arabic,
    required this.translation,
  });

  final int number;
  final String arabic;
  final String translation;
}
