import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_badge.dart';
import 'azkar_badge_chip.dart';
import 'azkar_style.dart';

class AzkarDhikrHeaderRow extends StatelessWidget {
  const AzkarDhikrHeaderRow({
    super.key,
    required this.number,
    required this.source,
    required this.badge,
    required this.solidNumber,
  });

  final int number;
  final String source;
  final AzkarBadge badge;
  final bool solidNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: solidNumber
                ? AzkarPalette.emerald
                : AzkarPalette.emerald.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: AppTheme.text(
              size: 11,
              weight: FontWeight.w700,
              color: solidNumber ? Colors.white : AzkarPalette.emerald,
              height: 16,
              letterSpacing: 0.44,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.surfaceLow,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              source,
              maxLines: 1,
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
        if (badge != AzkarBadge.none) ...[
          const SizedBox(width: 8),
          AzkarBadgeChip(badge: badge),
        ],
      ],
    );
  }
}
