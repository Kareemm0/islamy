import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/home_repository_impl.dart';
import '../../data/datasources/prayer_times_remote_datasource.dart';
import '../../domain/entities/home_azkar_period.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

/// Manages the interactive state of the home dashboard.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({HomeRepository? repository})
    : super(
        HomeState.initial(
          (repository ?? const HomeRepositoryImpl()).getDashboardData(),
        ),
      ) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    _loadPrayerTimes();
  }

  Timer? _timer;

  Future<void> _loadPrayerTimes() async {
    try {
      final result = await PrayerTimesRemoteDataSource().getToday();
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
        location: '${result.city}, Egypt',
        prayers: result.prayers,
        nextPrayerIndex: nextIndex,
        initialRemaining: target.difference(now),
      );
      emit(state.copyWith(data: data, remaining: target.difference(now)));
    } catch (_) {
      // Keep the bundled dashboard values when location or the service is unavailable.
    }
  }

  void toggleAthan() {
    emit(state.copyWith(athanActive: !state.athanActive));
  }

  void _tick() {
    if (isClosed) return;
    if (state.remaining.inSeconds > 0) {
      emit(
        state.copyWith(remaining: state.remaining - const Duration(seconds: 1)),
      );
    }
  }

  void selectPeriod(HomeAzkarPeriod period) {
    if (period == state.period) return;
    emit(state.copyWith(period: period));
  }

  void startReadingAzkar() {
    if (state.azkarDone < state.azkarContent.total) {
      final updated = Map<HomeAzkarPeriod, int>.of(state.azkarDoneMap)
        ..[state.period] = state.azkarDone + 1;
      emit(state.copyWith(azkarDoneMap: updated));
    }
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
