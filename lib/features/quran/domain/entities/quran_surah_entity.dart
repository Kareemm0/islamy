enum SurahRevelation { makki, madani }

class QuranSurah {
  const QuranSurah({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.meaning,
    required this.ayahCount,
    required this.revelation,
    this.isFridaySunnah = false,
  });

  final int number;
  final String name;
  final String arabicName;
  final String meaning;
  final int ayahCount;
  final SurahRevelation revelation;
  final bool isFridaySunnah;
}
