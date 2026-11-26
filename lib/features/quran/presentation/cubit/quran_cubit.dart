import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_surahs_usecase.dart';
import 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({required this._getSurahs})
    : super(QuranState(allSurahs: const [], status: QuranStatus.loading));

  final GetSurahsUseCase _getSurahs;

  Future<void> loadSurahs() async {
    emit(state.copyWith(status: QuranStatus.loading, clearError: true));
    final result = await _getSurahs();
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: QuranStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (surahs) => emit(
        state.copyWith(
          allSurahs: List.unmodifiable(surahs),
          status: QuranStatus.success,
          clearError: true,
        ),
      ),
    );
  }

  void setQuery(String value) {
    emit(state.copyWith(query: value));
  }
}
