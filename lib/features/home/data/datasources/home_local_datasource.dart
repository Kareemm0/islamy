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

  HomeDashboardData getDashboardData() {
    return const HomeDashboardData(
      hijriDateEn: '١٤ رمضان ١٤٤٦ هـ',
      hijriDateAr: '١٤ رمضان ١٤٤٦ هـ',
      gregorianDate: 'الجمعة، ١٤ مارس ٢٠٢٥',
      location: 'القاهرة، مصر',
      prayers: [
        HomePrayer(name: 'الفجر', arabicName: 'الفجر', time: '04:42'),
        HomePrayer(name: 'الظهر', arabicName: 'الظهر', time: '12:04'),
        HomePrayer(name: 'العصر', arabicName: 'العصر', time: '03:28'),
        HomePrayer(name: 'المغرب', arabicName: 'المغرب', time: '06:05'),
        HomePrayer(name: 'العشاء', arabicName: 'العشاء', time: '07:22'),
      ],
      nextPrayerIndex: 2,
      qiblaDegrees: 136,
      initialRemaining: Duration(hours: 1, minutes: 24, seconds: 16),
      initialAthanActive: true,
      morningAzkar: _morningAzkar,
      eveningAzkar: _eveningAzkar,
      initialAzkarDone: {
        HomeAzkarPeriod.morning: 6,
        HomeAzkarPeriod.evening: 0,
      },
      lastReadSurah: 'سورة الكهف',
      lastReadSurahAr: 'سورة الكهف',
      lastReadPage: 297,
      lastReadAyah: 28,
      lastReadProgress: 0.45,
      initialTasbihCount: 33,
      hadith: HomeHadith(
        arabicLines: [
          '«مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ',
          'بِهِ طَرِيقًا إِلَى الْجَنَّةِ»',
        ],
        narrator: 'قال رسول الله ﷺ',
        translationLines: [],
        source: 'صحيح مسلم: 2699',
        grade: 'صحيح',
      ),
      initialHadithBookmarked: false,
      pagesGoal: 8,
      initialPagesRead: 6,
    );
  }
}
