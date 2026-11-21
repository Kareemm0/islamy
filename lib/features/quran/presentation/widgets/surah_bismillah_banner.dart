import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

class SurahBismillahBanner extends StatelessWidget {
  const SurahBismillahBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.surfaceContainer),
      ),
      child: Text(
        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppTheme.arabic(
          size: 24,
          weight: FontWeight.w700,
          color: AppColors.primary,
          height: 36,
        ),
      ),
    );
  }
}
