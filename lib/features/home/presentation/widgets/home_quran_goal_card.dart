import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/home_state.dart';
import 'home_style.dart';
import 'home_svg.dart';

/// Section 6: Daily Quran Goal progress widget.
class HomeQuranGoalCard extends StatelessWidget {
  const HomeQuranGoalCard({
    super.key,
    required this.state,
    required this.onReadPage,
  });

  final HomeState state;
  final VoidCallback onReadPage;

  @override
  Widget build(BuildContext context) {
    final percent = (state.goalProgress * 100).round();
    final isAtDefault = state.pagesRead == 6 && state.pagesGoal == 8;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: HomeStyle.cardShadow,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isAtDefault) ...[
                  Transform.rotate(
                    angle: -math.pi / 2,
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        HomeSvg('goal_ring_track', width: 58, height: 58),
                        HomeSvg('goal_ring_progress', width: 58, height: 58),
                      ],
                    ),
                  ),
                ] else
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: CircularProgressIndicator(
                      value: state.goalProgress.clamp(0.0, 1.0),
                      strokeWidth: 5,
                      backgroundColor: AppColors.surfaceContainer,
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.primary,
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                Text(
                  '$percent%',
                  style: AppTheme.text(
                    size: 15,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                    height: 15,
                    letterSpacing: 0.15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'ورد اليوم القرآني',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(
                          size: 15,
                          weight: FontWeight.w700,
                          color: AppColors.onSurface,
                          height: 20,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.gold,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${state.pagesRead} من ${state.pagesGoal}',
                        style: AppTheme.text(
                          size: 13,
                          weight: FontWeight.w700,
                          color: AppColors.primary,
                          height: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' صفحات قُرئت اليوم.\n',
                        style: AppTheme.text(
                          size: 13,
                          color: AppColors.onSurfaceVariant,
                          height: 18,
                        ),
                      ),
                      TextSpan(
                        text: state.pagesLeft > 0
                            ? 'تبقى ${state.pagesLeft} '
                                '${state.pagesLeft == 1 ? 'صفحة' : 'صفحات'} فقط!'
                            : 'اكتمل الورد اليومي!',
                        style: AppTheme.text(
                          size: 13,
                          color: AppColors.onSurfaceVariant,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onReadPage,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'اقرأ',
                      style: AppTheme.text(
                        size: 13,
                        weight: FontWeight.w700,
                        color: AppColors.primary,
                        height: 18,
                        letterSpacing: 0.26,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const HomeSvg(
                      'icon_read_arrow',
                      width: 14.667,
                      height: 10.667,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
