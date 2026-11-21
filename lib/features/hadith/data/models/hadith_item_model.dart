import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/hadith_item_entity.dart';

part 'hadith_item_model.freezed.dart';
part 'hadith_item_model.g.dart';

@freezed
abstract class HadithItemModel with _$HadithItemModel {
  const HadithItemModel._();

  const factory HadithItemModel({
    required int number,
    @Default('') String arab,
    @Default('') String id,
  }) = _HadithItemModel;

  factory HadithItemModel.fromJson(Map<String, dynamic> json) =>
      _$HadithItemModelFromJson(json);

  HadithItem toEntity() => HadithItem(
        number: number,
        arabic: arab,
        translation: id,
      );
}
