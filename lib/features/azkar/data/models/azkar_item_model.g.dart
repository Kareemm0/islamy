// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AzkarItemModel _$AzkarItemModelFromJson(Map<String, dynamic> json) =>
    _AzkarItemModel(
      category: json['category'] as String? ?? '',
      count: json['count'] as String? ?? '1',
      description: json['description'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$AzkarItemModelToJson(_AzkarItemModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'description': instance.description,
      'reference': instance.reference,
      'content': instance.content,
    };
