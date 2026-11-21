import '../../domain/entities/quran_surah_details_entity.dart';

sealed class SurahDetailsState {
  const SurahDetailsState();
}

final class SurahDetailsInitial extends SurahDetailsState {
  const SurahDetailsInitial();
}

final class SurahDetailsLoading extends SurahDetailsState {
  const SurahDetailsLoading();
}

final class SurahDetailsSuccess extends SurahDetailsState {
  const SurahDetailsSuccess(this.details);

  final QuranSurahDetails details;
}

final class SurahDetailsFailure extends SurahDetailsState {
  const SurahDetailsFailure(this.message);

  final String message;
}
