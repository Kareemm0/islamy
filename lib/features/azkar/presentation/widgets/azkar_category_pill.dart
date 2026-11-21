import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_category.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarCategoryPill extends StatelessWidget {
  const AzkarCategoryPill({
    super.key,
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final AzkarCategory category;
  final bool selected;
  final VoidCallback onTap;

  static const _icons = {
    AzkarCategory.morning: (AzkarAssets.filterMorning, 16.5, 16.5),
    AzkarCategory.evening: (AzkarAssets.filterEvening, 15.0, 15.0),
    AzkarCategory.afterPrayer: (AzkarAssets.filterAfterPrayer, 18.0, 15.0),
    AzkarCategory.sleep: (AzkarAssets.filterSleep, 16.5, 15.0),
  };

  @override
  Widget build(BuildContext context) {
    final icon = _icons[category]!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AzkarPalette.emerald : AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(9999),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AzkarIcon(
              icon.$1,
              width: icon.$2,
              height: icon.$3,
              color: selected ? Colors.white : AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              category.label,
              style: AppTheme.text(
                size: 13,
                weight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? Colors.white : AppColors.onSurfaceVariant,
                height: 18,
                letterSpacing: 0.26,
              ),
            ),
            const SizedBox(width: 6),
            Opacity(
              opacity: selected ? 0.8 : 1,
              child: Text(
                category.arabicLabel,
                textDirection: TextDirection.rtl,
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: selected ? Colors.white : AzkarPalette.outlineVariant,
                  height: 16,
                  letterSpacing: 0.44,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
