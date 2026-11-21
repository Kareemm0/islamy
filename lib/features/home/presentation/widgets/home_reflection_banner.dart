import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'home_style.dart';

/// Section 7: Visual Quran Sanctuary Mood Banner.
class HomeReflectionBanner extends StatelessWidget {
  const HomeReflectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: HomeStyle.cardShadow,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/home/quran_banner_photo.png',
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0, 0.55, 1],
                colors: [
                  AppColors.primary.withValues(alpha: 0.92),
                  AppColors.primary.withValues(alpha: 0.65),
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 230),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RAMADAN REFLECTION',
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
                        '"The best of you are those who learn the Quran and teach it."',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(
                          size: 18,
                          weight: FontWeight.w700,
                          color: Colors.white,
                          height: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
