import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quran_surah_details_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';
import 'quran_ayah_model.dart';

part 'quran_surah_details_model.freezed.dart';
part 'quran_surah_details_model.g.dart';

@freezed
abstract class QuranSurahDetailsModel with _$QuranSurahDetailsModel {
  const QuranSurahDetailsModel._();

  const factory QuranSurahDetailsModel({
    required int number,
    required String name,
    required String englishName,
    required String englishNameTranslation,
    @Default(0) int numberOfAyahs,
    @Default('') String revelationType,
    @Default(<QuranAyahModel>[]) List<QuranAyahModel> ayahs,
  }) = _QuranSurahDetailsModel;

  factory QuranSurahDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$QuranSurahDetailsModelFromJson(json);

  QuranSurahDetails toEntity() => QuranSurahDetails(
        surah: QuranSurah(
          number: number,
          name: englishName,
          arabicName: name,
          meaning: englishNameTranslation,
          ayahCount: numberOfAyahs,
          revelation: revelationType.toLowerCase() == 'medinan'
              ? SurahRevelation.madani
              : SurahRevelation.makki,
          isFridaySunnah: number == 18,
        ),
        ayahs: List.unmodifiable(ayahs.map((a) => a.toEntity())),
      );
}
