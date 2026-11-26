import '../../domain/entities/home_azkar_content.dart';
import '../../domain/entities/home_azkar_period.dart';
import '../../domain/entities/home_dashboard_data.dart';
import '../../domain/entities/home_hadith.dart';
import '../../domain/entities/home_prayer.dart';

/// In-memory sample data source for the home dashboard.
class HomeLocalDatasource {
  const HomeLocalDatasource();

  static const _morningAzkar = HomeAzkarContent(
    arabicTitle: 'أذكار الصباح',
    englishTitle: '',
    lines: [
      'ابدأ يومك بذكر الله •',
      'حفظ ونور وسكينة.',
    ],
    recommendation: 'يُستحب بعد\nصلاة الفجر',
    total: 24,
  );

  static const _eveningAzkar = HomeAzkarContent(
    arabicTitle: 'أذكار المساء',
    englishTitle: '',
    lines: [
      'اختم يومك بذكر الله •',
      'طمأنينة ومغفرة وشكر.',
    ],
    recommendation: 'يُستحب بعد\nصلاة العصر',
    total: 24,
  );

  static const List<HomeHadith> _dailyHadiths = [
    HomeHadith(
      arabicLines: [
        '«مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ',
        'بِهِ طَرِيقًا إِلَى الْجَنَّةِ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو هريرة (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح مسلم: 2699',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه عمر بن الخطاب (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح البخاري: 1',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ،',
        'وَفِي كُلٍّ خَيْرٌ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو هريرة (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح مسلم: 2664',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أنس بن مالك (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح البخاري: 13',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو هريرة (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح البخاري: 6018',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه عبد الله بن عمرو (رضي الله عنهما)',
      translationLines: [],
      source: 'صحيح البخاري: 10',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«الطُّهُورُ شَطْرُ الْإِيمَانِ، وَالْحَمْدُ لِلَّهِ تَمْلَأُ الْمِيزَانَ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو مالك الأشعري (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح مسلم: 223',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو ذر الغفاري (رضي الله عنه)',
      translationLines: [],
      source: 'جامع الترمذي: 1956',
      grade: 'حسن',
    ),
    HomeHadith(
      arabicLines: [
        '«كَلِمَتَانِ خَفِيفَتَانِ عَلَى اللِّسَانِ، ثَقِيلَتَانِ فِي الْمِيزَانِ:',
        'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه أبو هريرة (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح البخاري: 6406',
      grade: 'صحيح',
    ),
    HomeHadith(
      arabicLines: [
        '«خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ»',
      ],
      narrator: 'قال رسول الله ﷺ • رواه عثمان بن عفان (رضي الله عنه)',
      translationLines: [],
      source: 'صحيح البخاري: 5027',
      grade: 'صحيح',
    ),
  ];

  /// Returns a deterministic Hadith of the Day based on the local calendar date.
  static HomeHadith hadithForDate([DateTime? date]) {
    final now = date ?? DateTime.now();
    final daySlot =
        DateTime.utc(now.year, now.month, now.day).millisecondsSinceEpoch ~/
        Duration.millisecondsPerDay;
    return _dailyHadiths[daySlot % _dailyHadiths.length];
  }

  HomeDashboardData getDashboardData() {
    return HomeDashboardData(
      hijriDateEn: '',
      hijriDateAr: '',
      gregorianDate: '',
      location: '',
      prayers: const [],
      nextPrayerIndex: 0,
      qiblaDegrees: 136,
      initialRemaining: Duration.zero,
      initialAthanActive: true,
      morningAzkar: _morningAzkar,
      eveningAzkar: _eveningAzkar,
      initialAzkarDone: const {
        HomeAzkarPeriod.morning: 6,
        HomeAzkarPeriod.evening: 0,
      },
      lastReadSurah: 'سورة الكهف',
      lastReadSurahAr: 'سورة الكهف',
      lastReadPage: 297,
      lastReadAyah: 28,
      lastReadProgress: 0.45,
      initialTasbihCount: 33,
      hadith: hadithForDate(),
      initialHadithBookmarked: false,
      pagesGoal: 8,
      initialPagesRead: 6,
    );
  }
}
