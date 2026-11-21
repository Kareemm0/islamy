import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_quran_bookmarks_usecase.dart';
import '../../domain/usecases/get_quran_last_read_usecase.dart';
import '../../domain/usecases/get_surahs_usecase.dart';
import 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({
    required this._getSurahs,
    required GetQuranLastReadUseCase getLastRead,
    required GetQuranBookmarksUseCase getBookmarks,
  }) : super(
          QuranState(
            allSurahs: const [],
            lastRead: getLastRead(),
            bookmarked: Set<int>.unmodifiable(getBookmarks()),
            status: QuranStatus.loading,
          ),
        );

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

  void toggleBookmark(int number) {
    final next = Set<int>.of(state.bookmarked);
    if (!next.remove(number)) {
      next.add(number);
    }
    emit(state.copyWith(bookmarked: Set<int>.unmodifiable(next)));
  }
}
