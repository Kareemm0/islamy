import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/home_repository_impl.dart';
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
  }

  Timer? _timer;

  void toggleAthan() {
    emit(state.copyWith(athanActive: !state.athanActive));
  }

  void _tick() {
    if (isClosed) return;
    if (state.remaining.inSeconds > 0) {
      emit(
        state.copyWith(
          remaining: state.remaining - const Duration(seconds: 1),
        ),
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
