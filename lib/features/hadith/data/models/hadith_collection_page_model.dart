import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/hadith_collection_page_entity.dart';
import 'hadith_item_model.dart';
import 'hadith_pagination_model.dart';

part 'hadith_collection_page_model.freezed.dart';
part 'hadith_collection_page_model.g.dart';

@freezed
abstract class HadithCollectionPageModel with _$HadithCollectionPageModel {
  const HadithCollectionPageModel._();

  const factory HadithCollectionPageModel({
    @Default('') String name,
    @Default('') String slug,
    @Default(0) int total,
    @Default(HadithPaginationModel()) HadithPaginationModel pagination,
    @Default(<HadithItemModel>[]) List<HadithItemModel> items,
  }) = _HadithCollectionPageModel;

  factory HadithCollectionPageModel.fromJson(Map<String, dynamic> json) =>
      _$HadithCollectionPageModelFromJson(json);

  HadithCollectionPage toEntity() => HadithCollectionPage(
        name: name,
        slug: slug,
        total: total,
        pagination: pagination.toEntity(),
        items: List.unmodifiable(items.map((e) => e.toEntity())),
      );
}
