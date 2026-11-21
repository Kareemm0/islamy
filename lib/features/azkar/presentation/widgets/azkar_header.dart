import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'azkar_header_button.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

/// Top app bar of the screen (brand + search / notifications / profile).
class AzkarHeader extends StatelessWidget {
  const AzkarHeader({
    super.key,
    required this.searching,
    required this.onToggleSearch,
  });

  final bool searching;
  final VoidCallback onToggleSearch;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: AzkarPalette.emerald.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إسلامي',
                      textDirection: TextDirection.rtl,
                      style: AppTheme.arabic(
                        size: 16,
                        weight: FontWeight.w700,
                        color: AppColors.gold,
                        height: 22,
                      ),
                    ),
                    Text(
                      'Azkar',
                      style: AppTheme.text(
                        size: 11,
                        weight: FontWeight.w600,
                        color: AppColors.onSurfaceVariant,
                        height: 16,
                        letterSpacing: 0.44,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AzkarHeaderButton(
                  tooltip: 'Search',
                  onTap: onToggleSearch,
                  child: searching
                      ? const Icon(
                          Icons.close,
                          size: 18,
                          color: AppColors.onSurfaceVariant,
                        )
                      : const AzkarIcon(AzkarAssets.headerSearch, width: 16.5),
                ),
                const SizedBox(width: 4),
                AzkarHeaderButton(
                  tooltip: 'Notifications',
                  onTap: () {},
                  child: const AzkarIcon(
                    AzkarAssets.headerBell,
                    width: 14.667,
                    height: 18.333,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const AzkarIcon(AzkarAssets.headerPerson, width: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
