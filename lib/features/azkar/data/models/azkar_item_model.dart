import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/azkar_badge.dart';
import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';

part 'azkar_item_model.freezed.dart';
part 'azkar_item_model.g.dart';

@freezed
abstract class AzkarItemModel with _$AzkarItemModel {
  const AzkarItemModel._();

  const factory AzkarItemModel({
    @Default('') String category,
    @Default('1') String count,
    @Default('') String description,
    @Default('') String reference,
    @Default('') String content,
  }) = _AzkarItemModel;

  factory AzkarItemModel.fromJson(Map<String, dynamic> json) =>
      _$AzkarItemModelFromJson(json);

  AzkarItem toEntity({
    required String id,
    required AzkarCategory targetCategory,
  }) {
    final reps = int.tryParse(count.trim()) ?? 1;
    final cleanContent = _sanitizeText(content);
    final cleanDescription = _sanitizeText(description);
    final cleanReference = _sanitizeReference(reference);

    final sourceLabel = cleanReference.isNotEmpty
        ? cleanReference
        : (reps > 1 ? '$reps مرات • ${targetCategory.label}' : targetCategory.label);

    return AzkarItem(
      id: id,
      category: targetCategory,
      source: sourceLabel,
      arabic: cleanContent,
      translation: cleanDescription,
      repetitions: reps <= 0 ? 1 : reps,
      badge: _inferBadge(cleanDescription),
    );
  }

  static String _sanitizeText(String raw) {
    if (raw.isEmpty) return '';
    return raw
        .replaceAll(RegExp(r"\\n',\s*'"), '\n')
        .replaceAll(r'\n', '\n')
        .replaceAll("', '", '\n')
        .replaceAll(RegExp(r"^[\s',]+|[\s',]+$"), '')
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty && line != "'")
        .join('\n')
        .trim();
  }

  static String _sanitizeReference(String raw) {
    final cleaned = _sanitizeText(raw)
        .replaceAll(RegExp(r'^[\s."]+|[\s."]+$'), '')
        .trim();
    return cleaned;
  }

  static AzkarBadge _inferBadge(String desc) {
    if (desc.isEmpty) return AzkarBadge.none;
    if (desc.contains('حرز') ||
        desc.contains('يضره') ||
        desc.contains('كفاه') ||
        desc.contains('النار')) {
      return AzkarBadge.protection;
    }
    if (desc.contains('الجنة') ||
        desc.contains('حسنة') ||
        desc.contains('شفاعت') ||
        desc.contains('يرضيه')) {
      return AzkarBadge.greatReward;
    }
    return AzkarBadge.none;
  }
}
