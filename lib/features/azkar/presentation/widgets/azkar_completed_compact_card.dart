import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_item.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarCompletedCompactCard extends StatelessWidget {
  const AzkarCompletedCompactCard({
    super.key,
    required this.number,
    required this.item,
    required this.onReread,
  });

  final int number;
  final AzkarItem item;
  final VoidCallback onReread;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.92,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AzkarPalette.cardBeige,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 26,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLow,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$number',
                    style: AppTheme.text(
                      size: 11,
                      weight: FontWeight.w700,
                      color: AppColors.onSurfaceVariant,
                      height: 16,
                      letterSpacing: 0.44,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      item.source,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.text(
                        size: 11,
                        weight: FontWeight.w600,
                        color: AppColors.onSurfaceVariant,
                        height: 16,
                        letterSpacing: 0.44,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AzkarPalette.mintText.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AzkarIcon(
                        AzkarAssets.badgeCompleted,
                        width: 13.333,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'تمت القراءة',
                        style: AppTheme.text(
                          size: 11,
                          weight: FontWeight.w700,
                          color: AppColors.primary,
                          height: 14,
                          letterSpacing: 0.44,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (item.title != null) ...[
                    Text(
                      item.title!,
                      textAlign: TextAlign.right,
                      style: AppTheme.text(
                        size: 13,
                        weight: FontWeight.w700,
                        color: AppColors.gold,
                        height: 18,
                        letterSpacing: 0.26,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  Text(
                    item.arabic,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: AppTheme.arabic(
                      size: item.arabicSize,
                      weight: FontWeight.w700,
                      color: AppColors.primary,
                      height: 34,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.translation,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(
                size: 13,
                color: AppColors.onSurfaceVariant,
                height: 18,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.recitedAt != null
                      ? 'قُرئ الساعة ${item.recitedAt}'
                      : 'اكتمل اليوم',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w600,
                    color: AppColors.onSurfaceVariant,
                    height: 16,
                    letterSpacing: 0.44,
                  ),
                ),
                TextButton(
                  onPressed: onReread,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'إعادة القراءة',
                    style: AppTheme.text(
                      size: 11,
                      weight: FontWeight.w700,
                      color: AppColors.primary,
                      height: 16,
                      letterSpacing: 0.44,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
