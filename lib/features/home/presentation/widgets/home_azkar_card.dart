import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/home_azkar_period.dart';
import '../cubit/home_state.dart';
import 'home_azkar_segment.dart';
import 'home_style.dart';
import 'home_svg.dart';

/// Morning / evening azkar banner with segment control and progress.
class HomeAzkarCard extends StatelessWidget {
  const HomeAzkarCard({
    super.key,
    required this.state,
    required this.onSelectPeriod,
    required this.onStartReading,
  });

  final HomeState state;
  final ValueChanged<HomeAzkarPeriod> onSelectPeriod;
  final VoidCallback onStartReading;

  @override
  Widget build(BuildContext context) {
    final c = state.azkarContent;
    final morning = state.period == HomeAzkarPeriod.morning;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: HomeStyle.cardShadow,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            top: -24,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x33FFE088),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33FFE088),
                    blurRadius: 24,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLow,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HomeAzkarSegment(
                            label: 'الصباح',
                            selected: morning,
                            icon: const HomeSvg(
                              'icon_morning',
                              width: 12.833,
                              height: 12.833,
                            ),
                            onTap: () =>
                                onSelectPeriod(HomeAzkarPeriod.morning),
                          ),
                          HomeAzkarSegment(
                            label: 'المساء',
                            selected: !morning,
                            icon: const HomeSvg(
                              'icon_evening',
                              width: 10.5,
                              height: 10.5,
                            ),
                            onTap: () =>
                                onSelectPeriod(HomeAzkarPeriod.evening),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'أذكار الصباح والمغيب',
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
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                c.arabicTitle,
                                textDirection: TextDirection.rtl,
                                style: AppTheme.text(
                                  size: 20,
                                  weight: FontWeight.w700,
                                  color: AppColors.primary,
                                  height: 28,
                                ),
                              ),
                              Text(
                                c.englishTitle,
                                style: AppTheme.text(
                                  size: 14,
                                  color: AppColors.onSurfaceVariant,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.lines.join('\n'),
                            style: AppTheme.text(
                              size: 13,
                              color: AppColors.onSurfaceVariant,
                              height: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9999),
                                    child: LinearProgressIndicator(
                                      value: state.azkarProgress,
                                      minHeight: 8,
                                      backgroundColor: AppColors.surfaceLow,
                                      valueColor: const AlwaysStoppedAnimation(
                                        AppColors.gold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '${state.azkarDone} / ${c.total} مكتمل',
                                  style: AppTheme.text(
                                    size: 11,
                                    weight: FontWeight.w700,
                                    color: AppColors.primary,
                                    height: 16,
                                    letterSpacing: 0.44,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/home/azkar_thumbnail.png',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        c.recommendation,
                        style: AppTheme.text(
                          size: 11,
                          weight: FontWeight.w600,
                          color: AppColors.onSurfaceVariant,
                          height: 16,
                          letterSpacing: 0.44,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onStartReading,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: HomeStyle.cardShadow,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const HomeSvg(
                              'icon_start_reading_arrow',
                              width: 10.667,
                              height: 10.667,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'ابدأ القراءة',
                              textAlign: TextAlign.center,
                              style: AppTheme.text(
                                size: 13,
                                weight: FontWeight.w700,
                                color: Colors.white,
                                height: 18,
                                letterSpacing: 0.26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
