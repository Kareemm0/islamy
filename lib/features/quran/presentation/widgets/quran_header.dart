import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

class QuranHeader extends StatelessWidget {
  const QuranHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إسلامي',
                  textDirection: TextDirection.rtl,
                  style: AppTheme.arabic(
                    size: 11,
                    weight: FontWeight.w700,
                    color: AppColors.gold,
                    height: 16,
                  ),
                ),
                Text(
                  'القرآن الكريم',
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
    );
  }
}
