import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quran_surah_entity.dart';

part 'quran_surah_model.freezed.dart';
part 'quran_surah_model.g.dart';

@freezed
abstract class QuranSurahModel with _$QuranSurahModel {
  const QuranSurahModel._();

  const factory QuranSurahModel({
    required int number,
    required String name,
    required String englishName,
    required String englishNameTranslation,
    @Default(0) int numberOfAyahs,
    @Default('') String revelationType,
  }) = _QuranSurahModel;

  factory QuranSurahModel.fromJson(Map<String, dynamic> json) =>
      _$QuranSurahModelFromJson(json);

  QuranSurah toEntity() => QuranSurah(
        number: number,
        name: englishName,
        arabicName: name,
        meaning: englishNameTranslation,
        ayahCount: numberOfAyahs,
        revelation: revelationType.toLowerCase() == 'medinan'
            ? SurahRevelation.madani
            : SurahRevelation.makki,
        isFridaySunnah: number == 18,
      );
}
