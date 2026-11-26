import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarWisdomCard extends StatelessWidget {
  const AzkarWisdomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AzkarIcon(
                AzkarAssets.wisdomQuote,
                width: 12.5,
                height: 16.667,
              ),
              const SizedBox(width: 8),
              Text(
                'سنة نبوية',
                style: AppTheme.text(
                  size: 13,
                  weight: FontWeight.w700,
                  color: AppColors.gold,
                  height: 18,
                  letterSpacing: 0.26,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            '«مَثَلُ الَّذِي يَذْكُرُ رَبَّهُ وَالَّذِي لَا يَذْكُرُ رَبَّهُ، مَثَلُ الْحَيِّ وَالْمَيِّتِ»',
            style: AppTheme.text(size: 13, height: 21.13),
          ),
          const SizedBox(height: 8),
          Text(
            'صحيح البخاري 6407',
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
    );
  }
}
