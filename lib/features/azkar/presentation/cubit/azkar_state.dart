import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';

class AzkarState {
  const AzkarState({
    required this.items,
    this.category = AzkarCategory.morning,
    this.query = '',
    this.searching = false,
    this.playingAll = false,
    this.tasbihBeads = 0,
  });

  final List<AzkarItem> items;
  final AzkarCategory category;
  final String query;
  final bool searching;
  final bool playingAll;
  final int tasbihBeads;

  List<AzkarItem> get _inCategory =>
      items.where((i) => i.category == category).toList();

  List<AzkarItem> get visibleItems {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return _inCategory;
    return _inCategory
        .where(
          (i) =>
              i.translation.toLowerCase().contains(q) ||
              i.source.toLowerCase().contains(q) ||
              i.arabic.contains(q),
        )
        .toList();
  }

  /// 1-based position of [item] within its category.
  int numberOf(AzkarItem item) =>
      _inCategory.indexWhere((i) => i.id == item.id) + 1;

  int get totalCount => _inCategory.length;
  int get recitedCount => _inCategory.where((i) => i.isCompleted).length;
  int get remainingCount => totalCount - recitedCount;
  double get progress => totalCount == 0 ? 0 : recitedCount / totalCount;
  int get percent => (progress * 100).round();
  int get estimatedMinutes => (remainingCount * 0.5).round();

  AzkarState copyWith({
    List<AzkarItem>? items,
    AzkarCategory? category,
    String? query,
    bool? searching,
    bool? playingAll,
    int? tasbihBeads,
  }) {
    return AzkarState(
      items: items ?? this.items,
      category: category ?? this.category,
      query: query ?? this.query,
      searching: searching ?? this.searching,
      playingAll: playingAll ?? this.playingAll,
      tasbihBeads: tasbihBeads ?? this.tasbihBeads,
    );
  }
}
