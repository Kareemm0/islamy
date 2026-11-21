// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_surah_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuranSurahDetailsModel _$QuranSurahDetailsModelFromJson(
  Map<String, dynamic> json,
) => _QuranSurahDetailsModel(
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
  englishName: json['englishName'] as String,
  englishNameTranslation: json['englishNameTranslation'] as String,
  numberOfAyahs: (json['numberOfAyahs'] as num?)?.toInt() ?? 0,
  revelationType: json['revelationType'] as String? ?? '',
  ayahs:
      (json['ayahs'] as List<dynamic>?)
          ?.map((e) => QuranAyahModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <QuranAyahModel>[],
);

Map<String, dynamic> _$QuranSurahDetailsModelToJson(
  _QuranSurahDetailsModel instance,
) => <String, dynamic>{
  'number': instance.number,
  'name': instance.name,
  'englishName': instance.englishName,
  'englishNameTranslation': instance.englishNameTranslation,
  'numberOfAyahs': instance.numberOfAyahs,
  'revelationType': instance.revelationType,
  'ayahs': instance.ayahs,
};
