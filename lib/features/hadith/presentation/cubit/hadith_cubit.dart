import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/hadith/data/repositories/hadith_repository_impl.dart';
import 'package:islamy/features/hadith/domain/repositories/hadith_repository.dart';
import 'package:islamy/features/hadith/presentation/cubit/hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit({HadithRepository? repository})
      : super(_initialState(repository ?? const HadithRepositoryImpl()));

  static HadithState _initialState(HadithRepository repository) {
    return HadithState(
      hadithOfDay: repository.getHadithOfDay(),
      allBooks: List.unmodifiable(repository.getBooks()),
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
