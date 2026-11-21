import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quran_ayah_entity.dart';

part 'quran_ayah_model.freezed.dart';
part 'quran_ayah_model.g.dart';

bool _parseSajda(Object? raw) => raw != null && raw != false;

@freezed
abstract class QuranAyahModel with _$QuranAyahModel {
  const QuranAyahModel._();

  const factory QuranAyahModel({
    required int number,
    required int numberInSurah,
    required String text,
    @Default(0) int juz,
    @Default(0) int page,
    @JsonKey(name: 'sajda', fromJson: _parseSajda) @Default(false) bool hasSajda,
  }) = _QuranAyahModel;

  factory QuranAyahModel.fromJson(Map<String, dynamic> json) =>
      _$QuranAyahModelFromJson(json);

  QuranAyah toEntity() => QuranAyah(
        number: number,
        numberInSurah: numberInSurah,
        text: text,
        juz: juz,
        page: page,
        hasSajda: hasSajda,
      );
}
