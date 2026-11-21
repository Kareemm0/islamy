import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'quran_style.dart';

class QuranFridayBadge extends StatelessWidget {
  const QuranFridayBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.goldAccent,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(QuranAssets.fridayIcon, width: 11, height: 11),
          const SizedBox(width: 2),
          Text(
            'Friday Sunnah',
            style: AppTheme.text(
              size: 11,
              weight: FontWeight.w600,
              color: AppColors.gold,
              height: 16,
              letterSpacing: 0.44,
            ),
          ),
        ],
      ),
    );
  }
}
