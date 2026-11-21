import 'package:flutter/material.dart';

import '../../domain/entities/azkar_item.dart';
import 'azkar_completed_compact_card.dart';
import 'azkar_standard_dhikr_card.dart';

/// Renders one dhikr item in its appropriate visual state:
/// - Completed featured/compact card (e.g. Ayat Al-Kursi with [AzkarItem.recitedAt])
/// - Multi-repetition interactive card with circular progress counter
/// - Single-repetition active / completed card
class AzkarDhikrCard extends StatelessWidget {
  const AzkarDhikrCard({
    super.key,
    required this.number,
    required this.item,
    required this.onTapCount,
    required this.onReread,
  });

  final int number;
  final AzkarItem item;
  final VoidCallback onTapCount;
  final VoidCallback onReread;

  bool get _isCompactCompleted =>
      item.isCompleted && (item.title != null || item.recitedAt != null);

  @override
  Widget build(BuildContext context) {
    if (_isCompactCompleted) {
      return AzkarCompletedCompactCard(
        number: number,
        item: item,
        onReread: onReread,
      );
    }
    return AzkarStandardDhikrCard(
      number: number,
      item: item,
      onTapCount: onTapCount,
    );
  }
}
