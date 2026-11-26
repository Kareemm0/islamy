import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

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
                      'الأذكار',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
