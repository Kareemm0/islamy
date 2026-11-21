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
    englishTitle: '(Morning Adhkar)',
    lines: [
      'Start your day in divine remembrance •',
      'Protection, light, and serenity.',
    ],
    recommendation: 'Recommended after\nFajr',
    total: 24,
  );

  static const _eveningAzkar = HomeAzkarContent(
    arabicTitle: 'أذكار المساء',
    englishTitle: '(Evening Adhkar)',
    lines: [
      'Close your day in divine remembrance •',
      'Peace, forgiveness, and gratitude.',
    ],
    recommendation: 'Recommended after\nAsr',
    total: 24,
  );

  HomeDashboardData getDashboardData() {
    return const HomeDashboardData(
      hijriDateEn: '14 Ramadan 1446 AH',
      hijriDateAr: '١٤ رمضان ١٤٤٦ هـ',
      gregorianDate: 'Friday, March 14, 2025',
      location: 'Cairo, Egypt',
      prayers: [
        HomePrayer(name: 'Fajr', arabicName: 'الفجر', time: '04:42'),
        HomePrayer(name: 'Dhuhr', arabicName: 'الظهر', time: '12:04'),
        HomePrayer(name: 'Asr', arabicName: 'العصر', time: '03:28'),
        HomePrayer(name: 'Maghrib', arabicName: 'المغرب', time: '06:05'),
        HomePrayer(name: 'Isha', arabicName: 'العشاء', time: '07:22'),
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
      lastReadSurah: 'Surah Al-Kahf',
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
        translationLines: [
          '"Whoever takes a path upon which he seeks knowledge, Allah makes the '
              'path to Paradise easy for him."',
        ],
        source: 'Sahih Muslim (صحيح مسلم: 2699)',
        grade: 'Sahih (Authentic)',
      ),
      initialHadithBookmarked: false,
      pagesGoal: 8,
      initialPagesRead: 6,
    );
  }
}
