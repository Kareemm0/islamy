import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_surah_details_usecase.dart';
import 'surah_details_state.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  SurahDetailsCubit(this._getSurahDetails)
      : super(const SurahDetailsInitial());

  final GetSurahDetailsUseCase _getSurahDetails;

  Future<void> loadSurah(int surahId) async {
    emit(const SurahDetailsLoading());
    final result = await _getSurahDetails(surahId);
    if (isClosed) return;
    result.fold(
      (failure) => emit(SurahDetailsFailure(failure.message)),
      (details) => emit(SurahDetailsSuccess(details)),
    );
  }
}
