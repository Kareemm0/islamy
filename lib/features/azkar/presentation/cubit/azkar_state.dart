import 'package:flutter/foundation.dart';

import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';

enum AzkarStatus { initial, loading, success, failure }

@immutable
class AzkarState {
  const AzkarState({
    required this.items,
    this.status = AzkarStatus.initial,
    this.category = AzkarCategory.morning,
    this.query = '',
    this.searching = false,
    this.playingAll = false,
    this.tasbihBeads = 0,
    this.errorMessage,
  });

  final List<AzkarItem> items;
  final AzkarStatus status;
  final AzkarCategory category;
  final String query;
  final bool searching;
  final bool playingAll;
  final int tasbihBeads;
  final String? errorMessage;

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
    AzkarStatus? status,
    AzkarCategory? category,
    String? query,
    bool? searching,
    bool? playingAll,
    int? tasbihBeads,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AzkarState(
      items: items ?? this.items,
      status: status ?? this.status,
      category: category ?? this.category,
      query: query ?? this.query,
      searching: searching ?? this.searching,
      playingAll: playingAll ?? this.playingAll,
      tasbihBeads: tasbihBeads ?? this.tasbihBeads,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AzkarState &&
        listEquals(other.items, items) &&
        other.status == status &&
        other.category == category &&
        other.query == query &&
        other.searching == searching &&
        other.playingAll == playingAll &&
        other.tasbihBeads == tasbihBeads &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAll(items),
        status,
        category,
        query,
        searching,
        playingAll,
        tasbihBeads,
        errorMessage,
      );
}
