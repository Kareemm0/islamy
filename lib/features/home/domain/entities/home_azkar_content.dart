/// Static description of the azkar banner content for one period.
class HomeAzkarContent {
  const HomeAzkarContent({
    required this.arabicTitle,
    required this.englishTitle,
    required this.lines,
    required this.recommendation,
    required this.total,
  });

  final String arabicTitle;
  final String englishTitle;
  final List<String> lines;
  final String recommendation;
  final int total;
}
