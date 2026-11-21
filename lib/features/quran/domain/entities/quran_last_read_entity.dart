class QuranLastRead {
  const QuranLastRead({
    required this.surahNumber,
    required this.surahName,
    required this.arabicName,
    required this.ayah,
    required this.ayahLabel,
    required this.totalAyahs,
    required this.page,
    required this.juzLabel,
  });

  final int surahNumber;
  final String surahName;
  final String arabicName;
  final int ayah;
  final String ayahLabel;
  final int totalAyahs;
  final int page;
  final String juzLabel;

  double get progress => ayah / totalAyahs;
}
