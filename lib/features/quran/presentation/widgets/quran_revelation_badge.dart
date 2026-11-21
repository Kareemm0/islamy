import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'quran_style.dart';

class QuranRevelationBadge extends StatelessWidget {
  const QuranRevelationBadge({
    super.key,
    required this.isMadani,
    required this.label,
  });

  final bool isMadani;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: isMadani
            ? QuranPalette.madaniBadgeBackground
            : AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTheme.text(
          size: 11,
          weight: FontWeight.w600,
          color: isMadani
              ? QuranPalette.madaniBadgeText
              : AppColors.onSurfaceVariant,
          height: 16,
          letterSpacing: 0.44,
        ),
      ),
    );
  }
}
