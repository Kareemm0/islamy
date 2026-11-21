import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'quran_header_icon.dart';
import 'quran_style.dart';

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
                  'Quran',
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
            const QuranHeaderIcon(
              asset: QuranAssets.headerSearch,
              width: 16.5,
              height: 16.5,
            ),
            const SizedBox(width: 4),
            const QuranHeaderIcon(
              asset: QuranAssets.headerBell,
              width: 14.667,
              height: 18.333,
            ),
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                QuranAssets.headerProfile,
                width: 12,
                height: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
