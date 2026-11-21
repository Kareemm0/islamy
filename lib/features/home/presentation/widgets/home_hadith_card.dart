import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/home_state.dart';
import 'home_action_icon.dart';
import 'home_style.dart';
import 'home_svg.dart';

/// Section 5: Hadith of the Day card.
class HomeHadithCard extends StatelessWidget {
  const HomeHadithCard({
    super.key,
    required this.state,
    required this.onToggleBookmark,
  });

  final HomeState state;
  final VoidCallback onToggleBookmark;

  @override
  Widget build(BuildContext context) {
    final h = state.hadith;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3EE),
        borderRadius: BorderRadius.circular(16),
        boxShadow: HomeStyle.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.goldContainer,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const HomeSvg(
                  'icon_hadith_badge',
                  width: 11.333,
                  height: 8,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Hadith of the Day',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(
                    size: 15,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                    height: 20,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'حديث اليوم',
                textDirection: TextDirection.rtl,
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.gold,
                  height: 16,
                  letterSpacing: 0.44,
                ),
              ),
              const Spacer(),
              HomeActionIcon(
                tooltip: state.hadithBookmarked
                    ? 'Remove bookmark'
                    : 'Bookmark',
                onTap: onToggleBookmark,
                child: Opacity(
                  opacity: state.hadithBookmarked ? 1 : 0.65,
                  child: const HomeSvg(
                    'icon_bookmark',
                    width: 10.5,
                    height: 13.5,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              HomeActionIcon(
                tooltip: 'Share hadith',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Hadith ready to share')),
                  );
                },
                child: const HomeSvg('icon_share', width: 13.5, height: 15),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  h.arabicLines.join('\n'),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: AppTheme.arabic(
                    size: 20,
                    weight: FontWeight.w700,
                    color: AppColors.onSurface,
                    height: 36,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  h.narrator,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
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
          const SizedBox(height: 11),
          Text(
            h.translationLines.join(' '),
            style: AppTheme.text(
              size: 15,
              color: AppColors.onSurface,
              height: 24.38,
            ).copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: Text(
                  h.source,
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
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HomeSvg(
                    'icon_verified',
                    width: 12.833,
                    height: 12.25,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    h.grade,
                    style: AppTheme.text(
                      size: 11,
                      weight: FontWeight.w500,
                      color: AppColors.primary,
                      height: 16,
                      letterSpacing: 0.44,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
