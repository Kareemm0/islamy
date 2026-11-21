import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_badge.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarBadgeChip extends StatelessWidget {
  const AzkarBadgeChip({super.key, required this.badge});

  final AzkarBadge badge;

  @override
  Widget build(BuildContext context) {
    final isProtection = badge == AzkarBadge.protection;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: isProtection
            ? AppColors.goldContainer.withValues(alpha: 0.4)
            : AppColors.mint,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AzkarIcon(
            isProtection ? AzkarAssets.badgeShield : AzkarAssets.badgeReward,
            width: isProtection ? 9.333 : 11.667,
            height: 11.667,
          ),
          const SizedBox(width: 4),
          Text(
            isProtection ? 'Protection' : 'Great Reward',
            style: AppTheme.text(
              size: 11,
              weight: FontWeight.w700,
              color: isProtection
                  ? AppColors.gold
                  : AzkarPalette.completedBadge,
              height: 16,
              letterSpacing: 0.44,
            ),
          ),
        ],
      ),
    );
  }
}
