import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_category.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarBanner extends StatelessWidget {
  const AzkarBanner({super.key, required this.category});

  final AzkarCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            AzkarPalette.emerald,
            AppColors.primary,
            AzkarPalette.emerald,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.goldAccent.withValues(alpha: 0.1),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AzkarIcon(
                          AzkarAssets.bannerStar,
                          width: 15,
                          height: 12,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'واحة الذكر',
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w600,
                            color: AppColors.goldAccent,
                            height: 16,
                            letterSpacing: 0.55,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.title,
                      style: AppTheme.text(
                        size: 20,
                        weight: FontWeight.w700,
                        color: Colors.white,
                        height: 28,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.subtitle,
                      style: AppTheme.text(
                        size: 13,
                        color: AzkarPalette.mintText,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                alignment: Alignment.center,
                child: const AzkarIcon(AzkarAssets.bannerSun, width: 21.667),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
