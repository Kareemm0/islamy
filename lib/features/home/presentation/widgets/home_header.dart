import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

import '../cubit/home_state.dart';
import 'home_svg.dart';

/// Top bar (logo/title + actions) followed by date chips and greeting.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 64,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إسلامي',
                    textDirection: TextDirection.rtl,
                    style: AppTheme.arabic(
                      size: 14,
                      weight: FontWeight.w700,
                      color: AppColors.gold,
                      height: 16,
                    ),
                  ),
                  Text(
                    'الرئيسية',
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
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (state.isPrayerLoading)
          const AppShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBox(width: 110, height: 16, radius: 6),
                    ShimmerBox(width: 96, height: 24, radius: 999),
                  ],
                ),
                SizedBox(height: 8),
                ShimmerBox(width: 130, height: 16, radius: 6),
              ],
            ),
          )
        else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.hijriDateAr,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.gold,
                  height: 16,
                  letterSpacing: 0.44,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomeSvg('icon_location', width: 12, height: 12),
                    const SizedBox(width: 6),
                    Text(
                      state.location,
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
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            state.gregorianDate,
            style: AppTheme.text(
              size: 13,
              color: AppColors.onSurfaceVariant,
              height: 18,
            ),
          ),
        ],
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerRight,
          child: Text(
            'السلام عليكم،',
            style: AppTheme.text(
              size: 26,
              weight: FontWeight.w700,
              color: AppColors.primary,
              height: 34,
              letterSpacing: -0.65,
            ),
          ),
        ),
      ],
    );
  }
}
