// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HadithBookModel _$HadithBookModelFromJson(Map<String, dynamic> json) =>
    _HadithBookModel(
      name: json['name'] as String,
      slug: json['slug'] as String,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HadithBookModelToJson(_HadithBookModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'total': instance.total,
    };
