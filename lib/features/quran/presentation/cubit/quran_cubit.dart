import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/quran_local_datasource.dart';
import '../../data/repositories/quran_repository_impl.dart';
import '../../domain/repositories/quran_repository.dart';
import 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({QuranRepository? repository})
      : super(
          _initialState(
            repository ?? const QuranRepositoryImpl(QuranLocalDatasource()),
          ),
        );

  static QuranState _initialState(QuranRepository repository) {
    return QuranState(
      allSurahs: List.unmodifiable(repository.getSurahs()),
      lastRead: repository.getLastRead(),
      bookmarked: Set<int>.unmodifiable(repository.getInitialBookmarks()),
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
