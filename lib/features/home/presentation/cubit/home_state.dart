import 'package:flutter/foundation.dart';

import '../../domain/entities/home_azkar_content.dart';
import '../../domain/entities/home_azkar_period.dart';
import '../../domain/entities/home_dashboard_data.dart';
import '../../domain/entities/home_hadith.dart';
import '../../domain/entities/home_prayer.dart';

/// Immutable UI state for the home dashboard.
@immutable
class HomeState {
  const HomeState({
    required this.data,
    required this.remaining,
    required this.athanActive,
    required this.period,
    required this.azkarDoneMap,
    required this.tasbihCount,
    required this.hadithBookmarked,
    required this.pagesRead,
    this.isPrayerLoading = true,
  });

  factory HomeState.initial(HomeDashboardData data) {
    return HomeState(
      data: data,
      remaining: data.initialRemaining,
      athanActive: data.initialAthanActive,
      period: HomeAzkarPeriod.morning,
      azkarDoneMap: Map<HomeAzkarPeriod, int>.unmodifiable(
        data.initialAzkarDone,
      ),
      tasbihCount: data.initialTasbihCount,
      hadithBookmarked: data.initialHadithBookmarked,
      pagesRead: data.initialPagesRead,
      isPrayerLoading: data.prayers.isEmpty,
    );
  }

  final HomeDashboardData data;
  final Duration remaining;
  final bool athanActive;
  final HomeAzkarPeriod period;
  final Map<HomeAzkarPeriod, int> azkarDoneMap;
  final int tasbihCount;
  final bool hadithBookmarked;
  final int pagesRead;
  final bool isPrayerLoading;

  // Header
  String get hijriDateEn => data.hijriDateEn;
  String get hijriDateAr => data.hijriDateAr;
  String get gregorianDate => data.gregorianDate;
  String get location => data.location;

  // Prayers
  List<HomePrayer> get prayers => data.prayers;
  int get nextPrayerIndex => data.nextPrayerIndex;
  int get qiblaDegrees => data.qiblaDegrees;
  HomePrayer get nextPrayer => data.prayers.isEmpty
      ? const HomePrayer(name: '', arabicName: '', time: '00:00')
      : data.prayers[data.nextPrayerIndex.clamp(0, data.prayers.length - 1)];

  String get remainingText {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(remaining.inHours)}:${two(remaining.inMinutes % 60)}:'
        '${two(remaining.inSeconds % 60)}';
  }

  // Azkar
  HomeAzkarContent get azkarContent => period == HomeAzkarPeriod.morning
      ? data.morningAzkar
      : data.eveningAzkar;
  int get azkarDone => azkarDoneMap[period] ?? 0;
  double get azkarProgress => azkarDone / azkarContent.total;

  // Quick shortcuts
  String get lastReadSurah => data.lastReadSurah;
  String get lastReadSurahAr => data.lastReadSurahAr;
  int get lastReadPage => data.lastReadPage;
  int get lastReadAyah => data.lastReadAyah;
  double get lastReadProgress => data.lastReadProgress;

  // Hadith
  HomeHadith get hadith => data.hadith;

  // Quran goal
  int get pagesGoal => data.pagesGoal;
  int get pagesLeft => pagesGoal - pagesRead;
  double get goalProgress => pagesRead / pagesGoal;

  HomeState copyWith({
    HomeDashboardData? data,
    Duration? remaining,
    bool? athanActive,
    HomeAzkarPeriod? period,
    Map<HomeAzkarPeriod, int>? azkarDoneMap,
    int? tasbihCount,
    bool? hadithBookmarked,
    int? pagesRead,
    bool? isPrayerLoading,
  }) {
    return HomeState(
      data: data ?? this.data,
      remaining: remaining ?? this.remaining,
      athanActive: athanActive ?? this.athanActive,
      period: period ?? this.period,
      azkarDoneMap: azkarDoneMap != null
          ? Map<HomeAzkarPeriod, int>.unmodifiable(azkarDoneMap)
          : this.azkarDoneMap,
      tasbihCount: tasbihCount ?? this.tasbihCount,
      hadithBookmarked: hadithBookmarked ?? this.hadithBookmarked,
      pagesRead: pagesRead ?? this.pagesRead,
      isPrayerLoading: isPrayerLoading ?? this.isPrayerLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeState &&
        other.data == data &&
        other.remaining == remaining &&
        other.athanActive == athanActive &&
        other.period == period &&
        mapEquals(other.azkarDoneMap, azkarDoneMap) &&
        other.tasbihCount == tasbihCount &&
        other.hadithBookmarked == hadithBookmarked &&
        other.pagesRead == pagesRead &&
        other.isPrayerLoading == isPrayerLoading;
  }

  @override
  int get hashCode => Object.hash(
    data,
    remaining,
    athanActive,
    period,
    Object.hashAllUnordered(
      azkarDoneMap.entries.map((e) => Object.hash(e.key, e.value)),
    ),
    tasbihCount,
    hadithBookmarked,
    pagesRead,
    isPrayerLoading,
  );
}
