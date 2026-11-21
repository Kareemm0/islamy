import '../../domain/entities/quran_last_read_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';

class QuranLocalDatasource {
  const QuranLocalDatasource();

  static const _lastRead = QuranLastRead(
    surahNumber: 2,
    surahName: 'Al-Baqarah',
    arabicName: 'سُورَةُ البَقَرَة',
    ayah: 255,
    ayahLabel: 'Ayah 255 (Ayat Al-Kursi)',
    totalAyahs: 286,
    page: 42,
    juzLabel: 'Juz 3 • Rub 2',
  );

  static const _surahs = <QuranSurah>[
    QuranSurah(
      number: 1,
      name: 'Al-Fatihah',
      arabicName: 'الفَاتِحَة',
      meaning: 'The Opening',
      ayahCount: 7,
      revelation: SurahRevelation.makki,
    ),
    QuranSurah(
      number: 2,
      name: 'Al-Baqarah',
      arabicName: 'البَقَرَة',
      meaning: 'The Cow',
      ayahCount: 286,
      revelation: SurahRevelation.madani,
    ),
    QuranSurah(
      number: 3,
      name: "Ali 'Imran",
      arabicName: 'آل عِمرَان',
      meaning: 'Family of Imran',
      ayahCount: 200,
      revelation: SurahRevelation.madani,
    ),
    QuranSurah(
      number: 4,
      name: 'An-Nisa',
      arabicName: 'النِّسَاء',
      meaning: 'The Women',
      ayahCount: 176,
      revelation: SurahRevelation.madani,
    ),
    QuranSurah(
      number: 18,
      name: 'Al-Kahf',
      arabicName: 'الكَهْف',
      meaning: 'The Cave',
      ayahCount: 110,
      revelation: SurahRevelation.makki,
      isFridaySunnah: true,
    ),
    QuranSurah(
      number: 36,
      name: 'Ya-Sin',
      arabicName: 'يس',
      meaning: 'Heart of Quran',
      ayahCount: 83,
      revelation: SurahRevelation.makki,
    ),
    QuranSurah(
      number: 55,
      name: 'Ar-Rahman',
      arabicName: 'الرَّحْمَن',
      meaning: 'The Beneficent',
      ayahCount: 78,
      revelation: SurahRevelation.madani,
    ),
    QuranSurah(
      number: 67,
      name: 'Al-Mulk',
      arabicName: 'المُلْك',
      meaning: 'The Sovereignty',
      ayahCount: 30,
      revelation: SurahRevelation.makki,
    ),
    QuranSurah(
      number: 112,
      name: 'Al-Ikhlas',
      arabicName: 'الإِخْلَاص',
      meaning: 'The Sincerity',
      ayahCount: 4,
      revelation: SurahRevelation.makki,
    ),
  ];

  static const _initialBookmarks = <int>{2};

  QuranLastRead getLastRead() => _lastRead;

  List<QuranSurah> getSurahs() => _surahs;

  Set<int> getInitialBookmarks() => _initialBookmarks;
}
