import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:islamy/core/local_storage/local_database.dart';

import '../../data/datasources/home_local_datasource.dart';
import '../../data/datasources/prayer_times_cache_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../data/datasources/prayer_times_remote_datasource.dart';
import '../../domain/entities/home_azkar_period.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

/// Manages the interactive state of the home dashboard.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    HomeRepository? repository,
    PrayerTimesCacheDatasource? cache,
  }) : _currentDay = DateTime.now().day,
       _cache =
           cache ??
           PrayerTimesCacheDatasource(Hive.box<String>(LocalDatabase.homeBox)),
       super(
         HomeState.initial(
           (repository ?? const HomeRepositoryImpl()).getDashboardData(),
         ),
       ) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    _loadPrayerTimes();
  }

  Timer? _timer;
  int _currentDay;
  final PrayerTimesCacheDatasource _cache;

  void _applyPrayerResult(PrayerTimesResult result) {
    if (isClosed) return;
    final now = DateTime.now();
    var nextIndex = result.prayers.indexWhere((prayer) {
      final parts = prayer.time.split(':');
      final time = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
      return time.isAfter(now);
    });
    if (nextIndex < 0) nextIndex = 0;
    final prayer = result.prayers[nextIndex];
    final parts = prayer.time.split(':');
    var target = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
    if (!target.isAfter(now)) target = target.add(const Duration(days: 1));
    final data = state.data.copyWithPrayerData(
      hijriDateEn: result.hijriDate,
      gregorianDate: result.gregorianDate,
      location: '${result.city}، مصر',
      prayers: result.prayers,
      nextPrayerIndex: nextIndex,
      initialRemaining: target.difference(now),
    );
    emit(
      state.copyWith(
        data: data,
        remaining: target.difference(now),
        isPrayerLoading: false,
      ),
    );
  }

  Future<void> _loadPrayerTimes() async {
    // 1. Load cached prayer times immediately if available
    final cached = _cache.getCached();
    if (cached != null && cached.prayers.isNotEmpty) {
      _applyPrayerResult(cached);
    } else {
      emit(state.copyWith(isPrayerLoading: true));
    }

    // 2. Refresh from remote API and update local cache
    try {
      final result = await PrayerTimesRemoteDataSource().getToday();
      if (isClosed) return;
      await _cache.save(result);
      _applyPrayerResult(result);
    } catch (_) {
      // Offline with no cache: keep shimmer/loading until connectivity returns
    }
  }

  void toggleAthan() {
    emit(state.copyWith(athanActive: !state.athanActive));
  }

  void _tick() {
    if (isClosed) return;
    final now = DateTime.now();
    var nextData = state.data;
    if (now.day != _currentDay) {
      _currentDay = now.day;
      nextData = nextData.copyWithHadith(HomeLocalDatasource.hadithForDate(now));
    }
    final nextRemaining = state.remaining.inSeconds > 0
        ? state.remaining - const Duration(seconds: 1)
        : state.remaining;
    if (nextData != state.data || nextRemaining != state.remaining) {
      emit(state.copyWith(data: nextData, remaining: nextRemaining));
    }
  }

  void selectPeriod(HomeAzkarPeriod period) {
    if (period == state.period) return;
    emit(state.copyWith(period: period));
  }

  void incrementTasbih() {
    emit(state.copyWith(tasbihCount: state.tasbihCount + 1));
  }

  void toggleHadithBookmark() {
    emit(state.copyWith(hadithBookmarked: !state.hadithBookmarked));
  }

  void readPage() {
    if (state.pagesRead < state.pagesGoal) {
      emit(state.copyWith(pagesRead: state.pagesRead + 1));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
