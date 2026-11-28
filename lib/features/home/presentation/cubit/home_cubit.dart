import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/local_storage/local_database.dart';
import 'package:islamy/core/notifications/azan_audio_service.dart';

import '../../data/datasources/home_local_datasource.dart';
import '../../data/datasources/prayer_times_cache_datasource.dart';
import '../../data/datasources/prayer_times_remote_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_azkar_period.dart';
import '../../domain/entities/home_prayer.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

/// Manages the interactive state of the home dashboard.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    HomeRepository? repository,
    PrayerTimesCacheDatasource? cache,
    AzanAudioService? azanService,
  }) : _currentDay = DateTime.now().day,
       _cache =
           cache ??
           PrayerTimesCacheDatasource(Hive.box<String>(LocalDatabase.homeBox)),
       _azanService =
           azanService ??
           (sl.isRegistered<AzanAudioService>() ? sl<AzanAudioService>() : null),
       super(
         HomeState.initial(
           (repository ?? const HomeRepositoryImpl()).getDashboardData(),
         ),
       ) {
    final initialEnabled = _azanService?.isEnabled;
    if (initialEnabled != null && initialEnabled != state.athanActive) {
      emit(state.copyWith(athanActive: initialEnabled));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    _loadPrayerTimes();
  }

  Timer? _timer;
  int _currentDay;
  final PrayerTimesCacheDatasource _cache;
  final AzanAudioService? _azanService;

  (int, Duration) _computeNextPrayer(List<HomePrayer> prayers, DateTime now) {
    var nextIndex = prayers.indexWhere((prayer) {
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
    final prayer = prayers[nextIndex];
    final parts = prayer.time.split(':');
    var target = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
    if (!target.isAfter(now)) target = target.add(const Duration(days: 1));
    return (nextIndex, target.difference(now));
  }

  void _applyPrayerResult(PrayerTimesResult result) {
    if (isClosed) return;
    _azanService?.updatePrayers(result.prayers);
    final now = DateTime.now();
    final (nextIndex, remaining) = _computeNextPrayer(result.prayers, now);
    final data = state.data.copyWithPrayerData(
      hijriDateEn: result.hijriDate,
      gregorianDate: result.gregorianDate,
      location: '${result.city}، مصر',
      prayers: result.prayers,
      nextPrayerIndex: nextIndex,
      initialRemaining: remaining,
    );
    emit(
      state.copyWith(
        data: data,
        remaining: remaining,
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
    final nextActive = !state.athanActive;
    emit(state.copyWith(athanActive: nextActive));
    _azanService?.setEnabled(nextActive);
  }

  void _tick() {
    if (isClosed) return;
    final now = DateTime.now();
    var nextData = state.data;
    if (now.day != _currentDay) {
      _currentDay = now.day;
      nextData = nextData.copyWithHadith(HomeLocalDatasource.hadithForDate(now));
    }

    final prayers = nextData.prayers;
    if (prayers.isNotEmpty) {
      // Check if current clock matches a prayer time
      if (state.athanActive) {
        _azanService?.checkPrayerTime(now, prayers);
      }

      // If countdown just hit 0, trigger Azan for the current target prayer
      // and advance to the next upcoming prayer.
      if (state.remaining.inSeconds <= 1) {
        final currentTargetPrayer =
            prayers[nextData.nextPrayerIndex.clamp(0, prayers.length - 1)];
        if (state.athanActive) {
          _azanService?.triggerForPrayer(currentTargetPrayer, now);
        }
        final (nextIndex, newRemaining) = _computeNextPrayer(prayers, now);
        nextData = nextData.copyWithPrayerData(
          hijriDateEn: nextData.hijriDateEn,
          gregorianDate: nextData.gregorianDate,
          location: nextData.location,
          prayers: prayers,
          nextPrayerIndex: nextIndex,
          initialRemaining: newRemaining,
        );
        emit(state.copyWith(data: nextData, remaining: newRemaining));
        return;
      }
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
