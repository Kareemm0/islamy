import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/home_state.dart';
import 'home_header_icon_button.dart';
import 'home_style.dart';
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
                    'Home',
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
              const HomeHeaderIconButton(
                child: HomeSvg('icon_header_search', width: 16.5, height: 16.5),
              ),
              const HomeHeaderIconButton(
                child: HomeSvg(
                  'icon_header_notifications',
                  width: 14.667,
                  height: 18.333,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const HomeSvg(
                  'icon_header_profile',
                  width: 12,
                  height: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.goldContainer,
                        borderRadius: BorderRadius.circular(9999),
                        boxShadow: HomeStyle.cardShadow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const HomeSvg(
                            'icon_hijri_star',
                            width: 11.667,
                            height: 11.083,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              state.hijriDateEn,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w600,
                                color: const Color(0xFF241A00),
                                height: 16,
                                letterSpacing: 0.44,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                  const SizedBox(width: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
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
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            'Assalamu Alaikum,',
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
