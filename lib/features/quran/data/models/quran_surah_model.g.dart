// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuranSurahModel _$QuranSurahModelFromJson(Map<String, dynamic> json) =>
    _QuranSurahModel(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: (json['numberOfAyahs'] as num?)?.toInt() ?? 0,
      revelationType: json['revelationType'] as String? ?? '',
    );

Map<String, dynamic> _$QuranSurahModelToJson(_QuranSurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
