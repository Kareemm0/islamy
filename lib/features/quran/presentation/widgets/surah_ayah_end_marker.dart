import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'quran_style.dart';

/// Inline Mushaf verse-end medallion displaying the ayah number in Arabic-Indic digits.
class SurahAyahEndMarker extends StatelessWidget {
  const SurahAyahEndMarker({super.key, required this.number});

  final int number;

  static String _toArabicIndic(int value) {
    const digits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return value
        .toString()
        .split('')
        .map((c) => digits[int.parse(c)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    final label = _toArabicIndic(number);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 30,
        height: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              QuranAssets.surahMedalFeatured,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: AppTheme.arabic(
                    size: 13,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                    height: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
