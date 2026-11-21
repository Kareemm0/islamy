import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_item.dart';
import 'azkar_dhikr_header_row.dart';
import 'azkar_multi_rep_footer.dart';
import 'azkar_single_rep_footer.dart';
import 'azkar_style.dart';

class AzkarStandardDhikrCard extends StatelessWidget {
  const AzkarStandardDhikrCard({
    super.key,
    required this.number,
    required this.item,
    required this.onTapCount,
  });

  final int number;
  final AzkarItem item;
  final VoidCallback onTapCount;

  @override
  Widget build(BuildContext context) {
    final isMulti = item.repetitions > 1;
    final activeHighlight = isMulti && !item.isCompleted;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AzkarPalette.emerald.withValues(
              alpha: activeHighlight ? 0.06 : 0.04,
            ),
            blurRadius: activeHighlight ? 16 : 10,
            offset: Offset(0, activeHighlight ? 4 : 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AzkarDhikrHeaderRow(
            number: number,
            source: item.source,
            badge: item.badge,
            solidNumber: activeHighlight,
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AzkarPalette.cardBeige,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.arabic,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: AppTheme.arabic(
                size: item.arabicSize,
                weight: FontWeight.w700,
                color: AppColors.primary,
                height: 36,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            item.translation,
            style: AppTheme.text(
              size: 15,
              color: AppColors.onSurface,
              height: 24.38,
            ),
          ),
          const SizedBox(height: 16),
          if (isMulti && !item.isCompleted)
            AzkarMultiRepFooter(item: item, onTapCount: onTapCount)
          else
            AzkarSingleRepFooter(item: item, onTapCount: onTapCount),
        ],
      ),
    );
  }
}
