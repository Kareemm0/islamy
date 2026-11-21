import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/hadith_pagination_entity.dart';

part 'hadith_pagination_model.freezed.dart';
part 'hadith_pagination_model.g.dart';

@freezed
abstract class HadithPaginationModel with _$HadithPaginationModel {
  const HadithPaginationModel._();

  const factory HadithPaginationModel({
    @Default(0) int totalItems,
    @Default(1) int currentPage,
    @Default(20) int pageSize,
    @Default(1) int totalPages,
    @Default(<int>[]) List<int> pages,
  }) = _HadithPaginationModel;

  factory HadithPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$HadithPaginationModelFromJson(json);

  HadithPagination toEntity() => HadithPagination(
        totalItems: totalItems,
        currentPage: currentPage,
        pageSize: pageSize,
        totalPages: totalPages,
        pages: List<int>.unmodifiable(pages),
      );
}
