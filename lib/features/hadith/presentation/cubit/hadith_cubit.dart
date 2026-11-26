import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/hadith/domain/usecases/get_hadith_books_usecase.dart';
import 'package:islamy/features/hadith/domain/usecases/get_hadith_of_day_usecase.dart';
import 'package:islamy/features/hadith/presentation/cubit/hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit({
    required this._getBooks,
    required GetHadithOfDayUseCase getHadithOfDay,
  })  : _getHadithOfDay = getHadithOfDay,
        super(
          HadithState(
            hadithOfDay: getHadithOfDay(),
            allBooks: const [],
            status: HadithStatus.loading,
          ),
        );

  final GetHadithBooksUseCase _getBooks;
  final GetHadithOfDayUseCase _getHadithOfDay;
  Timer? _timer;

  /// Refreshes the spotlight hadith every 30 minutes.
  void startHadithRotation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 30), (_) {
      if (!isClosed) emit(state.copyWith(hadithOfDay: _getHadithOfDay()));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> loadBooks() async {
    emit(state.copyWith(status: HadithStatus.loading, clearError: true));
    final result = await _getBooks();
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HadithStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (books) => emit(
        state.copyWith(
          allBooks: List.unmodifiable(books),
          status: HadithStatus.success,
          clearError: true,
        ),
      ),
    );
  }

  void setQuery(String value) {
    emit(state.copyWith(query: value));
  }

  void toggleSahihOnly() {
    emit(state.copyWith(sahihOnly: !state.sahihOnly));
  }

  void toggleSaved() {
    emit(state.copyWith(saved: !state.saved));
  }

  void registerCopy() {
    emit(state.copyWith(copyCount: state.copyCount + 1));
  }
}
