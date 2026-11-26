import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/azkar_state.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarProgressCard extends StatelessWidget {
  const AzkarProgressCard({
    super.key,
    required this.state,
    required this.onResetProgress,
    required this.onTogglePlayAll,
  });

  final AzkarState state;
  final VoidCallback onResetProgress;
  final VoidCallback onTogglePlayAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AzkarPalette.emerald.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تقدم الورد اليومي',
                      style: AppTheme.text(
                        size: 11,
                        weight: FontWeight.w700,
                        color: AppColors.gold,
                        height: 16,
                        letterSpacing: 0.55,
                      ),
                    ),
                    const SizedBox(height: 4.5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${state.recitedCount} من ${state.totalCount}',
                            style: AppTheme.text(
                              size: 20,
                              weight: FontWeight.w700,
                              height: 28,
                            ),
                          ),
                          TextSpan(
                            text: '  تمت قراءتها (${state.percent}%)',
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
              InkResponse(
                onTap: onResetProgress,
                radius: 20,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceLow,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const AzkarIcon(
                    AzkarAssets.progressReset,
                    width: 12,
                    height: 13.837,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onTogglePlayAll,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldAccent,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state.playingAll
                          ? const Icon(
                              Icons.pause,
                              size: 14,
                              color: AzkarPalette.goldOnAccent,
                            )
                          : const AzkarIcon(
                              AzkarAssets.progressPlay,
                              width: 13.5,
                              height: 13.125,
                            ),
                      const SizedBox(width: 6),
                      Text(
                        state.playingAll ? 'إيقاف مؤقت' : 'تشغيل الكل',
                        style: AppTheme.text(
                          size: 11,
                          weight: FontWeight.w700,
                          color: AzkarPalette.goldOnAccent,
                          height: 16,
                          letterSpacing: 0.44,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: Container(
              height: 10,
              width: double.infinity,
              color: AppColors.surfaceContainer,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: state.progress.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    gradient: const LinearGradient(
                      colors: [
                        AzkarPalette.emerald,
                        AzkarPalette.mintText,
                        AppColors.goldAccent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  'تبقى ${state.remainingCount} أذكار',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w500,
                    color: AppColors.primary,
                    height: 16,
                    letterSpacing: 0.44,
                  ),
                ),
              ),
              Text(
                'الوقت المقدر: ~${state.estimatedMinutes} دقيقة',
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.gold,
                  height: 16,
                  letterSpacing: 0.44,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
