import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/home_prayer.dart';

/// Displays the upcoming prayer name, scheduled time, and live countdown.
class HomePrayerCountdownRow extends StatelessWidget {
  const HomePrayerCountdownRow({
    super.key,
    required this.nextPrayer,
    required this.remainingText,
  });

  final HomePrayer nextPrayer;
  final String remainingText;

  @override
  Widget build(BuildContext context) {
    final parts = nextPrayer.time.split(':');
    final hour = int.tryParse(parts.first) ?? 0;
    final minute = parts.length > 1 ? parts[1] : '00';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour < 12 ? 'AM' : 'PM';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    nextPrayer.name.toUpperCase(),
                    style: AppTheme.text(
                      size: 32,
                      weight: FontWeight.w700,
                      color: Colors.white,
                      height: 40,
                      letterSpacing: -0.8,
                    ),
                  ),
                  Text(
                    nextPrayer.arabicName,
                    textDirection: TextDirection.rtl,
                    style: AppTheme.arabic(
                      size: 24,
                      weight: FontWeight.w700,
                      color: AppColors.goldLight,
                      height: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Scheduled at $displayHour:$minute $period',
                style: AppTheme.text(
                  size: 13,
                  color: AppColors.mintSoft,
                  height: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'REMAINING',
              style: AppTheme.text(
                size: 11,
                weight: FontWeight.w600,
                color: AppColors.goldContainer,
                height: 16,
                letterSpacing: 0.55,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              remainingText,
              style:
                  AppTheme.text(
                    size: 32,
                    weight: FontWeight.w700,
                    color: AppColors.goldContainer,
                    height: 40,
                    letterSpacing: -0.8,
                  ).copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                    shadows: const [
                      Shadow(
                        color: Color(0x0D000000),
                        offset: Offset(0, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
