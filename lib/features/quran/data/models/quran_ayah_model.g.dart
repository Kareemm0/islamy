// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuranAyahModel _$QuranAyahModelFromJson(Map<String, dynamic> json) =>
    _QuranAyahModel(
      number: (json['number'] as num).toInt(),
      numberInSurah: (json['numberInSurah'] as num).toInt(),
      text: json['text'] as String,
      juz: (json['juz'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      hasSajda: json['sajda'] == null ? false : _parseSajda(json['sajda']),
    );

Map<String, dynamic> _$QuranAyahModelToJson(_QuranAyahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'numberInSurah': instance.numberInSurah,
      'text': instance.text,
      'juz': instance.juz,
      'page': instance.page,
      'sajda': instance.hasSajda,
    };
