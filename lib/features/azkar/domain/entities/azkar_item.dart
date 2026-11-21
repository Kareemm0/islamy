import 'azkar_badge.dart';
import 'azkar_category.dart';

class AzkarItem {
  const AzkarItem({
    required this.id,
    required this.category,
    required this.source,
    required this.arabic,
    required this.translation,
    this.repetitions = 1,
    this.count = 0,
    this.badge = AzkarBadge.none,
    this.title,
    this.arabicSize = 20,
    this.recitedAt,
  });

  final String id;
  final AzkarCategory category;
  final String source;
  final String arabic;
  final String translation;
  final int repetitions;
  final AzkarBadge badge;

  /// Optional heading (used by featured entries such as Ayat Al-Kursi).
  final String? title;
  final double arabicSize;

  final int count;
  final String? recitedAt;

  bool get isCompleted => count >= repetitions;
  int get remaining => repetitions - count;

  AzkarItem copyWith({
    int? count,
    String? recitedAt,
    bool clearRecitedAt = false,
  }) {
    return AzkarItem(
      id: id,
      category: category,
      source: source,
      arabic: arabic,
      translation: translation,
      repetitions: repetitions,
      count: count ?? this.count,
      badge: badge,
      title: title,
      arabicSize: arabicSize,
      recitedAt: clearRecitedAt ? null : (recitedAt ?? this.recitedAt),
    );
  }
}
