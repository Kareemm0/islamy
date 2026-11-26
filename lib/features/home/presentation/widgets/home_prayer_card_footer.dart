import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'home_svg.dart';

/// Footer bar of the home prayer card showing Qibla direction and settings link.
class HomePrayerCardFooter extends StatelessWidget {
  const HomePrayerCardFooter({super.key, required this.qiblaDegrees});

  final int qiblaDegrees;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 11),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0x26FFFFFF))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'اتجاه القبلة: $qiblaDegrees°\nجنوب شرق',
              style: AppTheme.text(
                size: 11,
                weight: FontWeight.w600,
                color: AppColors.mintSoft,
                height: 16,
                letterSpacing: 0.44,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'إعدادات الصلاة والأذان',
                    textAlign: TextAlign.center,
                    style: AppTheme.text(
                      size: 11,
                      weight: FontWeight.w600,
                      color: AppColors.goldContainer,
                      height: 16,
                      letterSpacing: 0.44,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const HomeSvg(
                  'icon_settings_arrow',
                  width: 10.5,
                  height: 10.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
