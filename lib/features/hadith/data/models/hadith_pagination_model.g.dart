// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HadithPaginationModel _$HadithPaginationModelFromJson(
  Map<String, dynamic> json,
) => _HadithPaginationModel(
  totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
  pages:
      (json['pages'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
);

Map<String, dynamic> _$HadithPaginationModelToJson(
  _HadithPaginationModel instance,
) => <String, dynamic>{
  'totalItems': instance.totalItems,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'totalPages': instance.totalPages,
  'pages': instance.pages,
};
