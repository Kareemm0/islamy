class QuranAyah {
  const QuranAyah({
    required this.number,
    required this.numberInSurah,
    required this.text,
    required this.juz,
    required this.page,
    this.hasSajda = false,
  });

  final int number;
  final int numberInSurah;
  final String text;
  final int juz;
  final int page;
  final bool hasSajda;
}
