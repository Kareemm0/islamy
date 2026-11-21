// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HadithItemModel _$HadithItemModelFromJson(Map<String, dynamic> json) =>
    _HadithItemModel(
      number: (json['number'] as num).toInt(),
      arab: json['arab'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$HadithItemModelToJson(_HadithItemModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'arab': instance.arab,
      'id': instance.id,
    };
