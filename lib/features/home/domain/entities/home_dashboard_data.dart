import 'home_azkar_content.dart';
import 'home_azkar_period.dart';
import 'home_hadith.dart';
import 'home_prayer.dart';

/// Aggregated dashboard data for the home feature.
class HomeDashboardData {
  const HomeDashboardData({
    required this.hijriDateEn,
    required this.hijriDateAr,
    required this.gregorianDate,
    required this.location,
    required this.prayers,
    required this.nextPrayerIndex,
    required this.qiblaDegrees,
    required this.initialRemaining,
    required this.initialAthanActive,
    required this.morningAzkar,
    required this.eveningAzkar,
    required this.initialAzkarDone,
    required this.lastReadSurah,
    required this.lastReadSurahAr,
    required this.lastReadPage,
    required this.lastReadAyah,
    required this.lastReadProgress,
    required this.initialTasbihCount,
    required this.hadith,
    required this.initialHadithBookmarked,
    required this.pagesGoal,
    required this.initialPagesRead,
  });

  final String hijriDateEn;
  final String hijriDateAr;
  final String gregorianDate;
  final String location;

  final List<HomePrayer> prayers;
  final int nextPrayerIndex;
  final int qiblaDegrees;
  final Duration initialRemaining;
  final bool initialAthanActive;

  final HomeAzkarContent morningAzkar;
  final HomeAzkarContent eveningAzkar;
  final Map<HomeAzkarPeriod, int> initialAzkarDone;

  final String lastReadSurah;
  final String lastReadSurahAr;
  final int lastReadPage;
  final int lastReadAyah;
  final double lastReadProgress;

  final int initialTasbihCount;

  final HomeHadith hadith;
  final bool initialHadithBookmarked;

  final int pagesGoal;
  final int initialPagesRead;

  HomeDashboardData copyWithPrayerData({
    required String hijriDateEn,
    required String gregorianDate,
    required String location,
    required List<HomePrayer> prayers,
    required int nextPrayerIndex,
    required Duration initialRemaining,
  }) => HomeDashboardData(
    hijriDateEn: hijriDateEn,
    hijriDateAr: hijriDateEn,
    gregorianDate: gregorianDate,
    location: location,
    prayers: prayers,
    nextPrayerIndex: nextPrayerIndex,
    qiblaDegrees: qiblaDegrees,
    initialRemaining: initialRemaining,
    initialAthanActive: initialAthanActive,
    morningAzkar: morningAzkar,
    eveningAzkar: eveningAzkar,
    initialAzkarDone: initialAzkarDone,
    lastReadSurah: lastReadSurah,
    lastReadSurahAr: lastReadSurahAr,
    lastReadPage: lastReadPage,
    lastReadAyah: lastReadAyah,
    lastReadProgress: lastReadProgress,
    initialTasbihCount: initialTasbihCount,
    hadith: hadith,
    initialHadithBookmarked: initialHadithBookmarked,
    pagesGoal: pagesGoal,
    initialPagesRead: initialPagesRead,
  );

  HomeDashboardData copyWithHadith(HomeHadith newHadith) => HomeDashboardData(
    hijriDateEn: hijriDateEn,
    hijriDateAr: hijriDateAr,
    gregorianDate: gregorianDate,
    location: location,
    prayers: prayers,
    nextPrayerIndex: nextPrayerIndex,
    qiblaDegrees: qiblaDegrees,
    initialRemaining: initialRemaining,
    initialAthanActive: initialAthanActive,
    morningAzkar: morningAzkar,
    eveningAzkar: eveningAzkar,
    initialAzkarDone: initialAzkarDone,
    lastReadSurah: lastReadSurah,
    lastReadSurahAr: lastReadSurahAr,
    lastReadPage: lastReadPage,
    lastReadAyah: lastReadAyah,
    lastReadProgress: lastReadProgress,
    initialTasbihCount: initialTasbihCount,
    hadith: newHadith,
    initialHadithBookmarked: initialHadithBookmarked,
    pagesGoal: pagesGoal,
    initialPagesRead: initialPagesRead,
  );
}
