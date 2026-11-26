import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/azkar/presentation/widgets/azkar_icon.dart';

import '../../domain/entities/azkar_item.dart';
import 'azkar_circle_action.dart';
import 'azkar_style.dart';

class AzkarMultiRepFooter extends StatelessWidget {
  const AzkarMultiRepFooter({
    super.key,
    required this.item,
    required this.onTapCount,
  });

  final AzkarItem item;
  final VoidCallback onTapCount;

  @override
  Widget build(BuildContext context) {
    final progress = item.count / item.repetitions;
    return Row(
      children: [
        AzkarCircleAction(
          size: 40,
          tooltip: 'فضل الذكر',
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('المصدر: ${item.source}')));
          },
          child: const AzkarIcon(AzkarAssets.actionInfo, width: 18.333),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'التكرار المستحب',
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.onSurfaceVariant,
                  height: 16,
                  letterSpacing: 0.44,
                ),
              ),
              Text(
                '${item.repetitions} مرات',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.text(
                  size: 13,
                  weight: FontWeight.w700,
                  color: AppColors.primary,
                  height: 18,
                  letterSpacing: 0.26,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Material(
                color: AzkarPalette.emerald,
                borderRadius: BorderRadius.circular(9999),
                elevation: 4,
                shadowColor: Colors.black.withValues(alpha: 0.12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(9999),
                  onTap: onTapCount,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (item.repetitions == 3 && item.count == 1)
                                Transform.rotate(
                                  angle: -math.pi / 2,
                                  child: const AzkarIcon(
                                    AzkarAssets.progressRing,
                                    width: 32,
                                  ),
                                )
                              else
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    value: progress.clamp(0.0, 1.0),
                                    strokeWidth: 2.5,
                                    backgroundColor: Colors.white.withValues(
                                      alpha: 0.2,
                                    ),
                                    valueColor: const AlwaysStoppedAnimation(
                                      AppColors.goldAccent,
                                    ),
                                  ),
                                ),
                              Text(
                                '${item.remaining}',
                                style: AppTheme.text(
                                  size: 11,
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 16,
                                  letterSpacing: 0.44,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'اضغط للعد',
                                  style: AppTheme.text(
                                    size: 13,
                                    weight: FontWeight.w700,
                                    color: Colors.white,
                                    height: 18,
                                    letterSpacing: 0.26,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const AzkarIcon(
                                  AzkarAssets.tapIcon,
                                  width: 11.55,
                                  height: 14,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'المتبقي: ${item.remaining} من ${item.repetitions}',
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w600,
                                color: AzkarPalette.mintText,
                                height: 16,
                                letterSpacing: 0.44,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
