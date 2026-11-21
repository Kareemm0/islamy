// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_collection_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HadithCollectionPageModel _$HadithCollectionPageModelFromJson(
  Map<String, dynamic> json,
) => _HadithCollectionPageModel(
  name: json['name'] as String? ?? '',
  slug: json['slug'] as String? ?? '',
  total: (json['total'] as num?)?.toInt() ?? 0,
  pagination: json['pagination'] == null
      ? const HadithPaginationModel()
      : HadithPaginationModel.fromJson(
          json['pagination'] as Map<String, dynamic>,
        ),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => HadithItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HadithItemModel>[],
);

Map<String, dynamic> _$HadithCollectionPageModelToJson(
  _HadithCollectionPageModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'total': instance.total,
  'pagination': instance.pagination,
  'items': instance.items,
};
