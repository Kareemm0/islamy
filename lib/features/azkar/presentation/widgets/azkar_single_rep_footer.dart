import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_item.dart';
import 'azkar_circle_action.dart';
import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarSingleRepFooter extends StatelessWidget {
  const AzkarSingleRepFooter({
    super.key,
    required this.item,
    required this.onTapCount,
  });

  final AzkarItem item;
  final VoidCallback onTapCount;

  @override
  Widget build(BuildContext context) {
    final done = item.isCompleted;
    return Row(
      children: [
        AzkarCircleAction(
          tooltip: 'Copy dhikr',
          onTap: () {
            Clipboard.setData(ClipboardData(text: item.arabic));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copied to clipboard')),
            );
          },
          child: const AzkarIcon(AzkarAssets.actionCopy, width: 16.667),
        ),
        const SizedBox(width: 6),
        AzkarCircleAction(
          tooltip: 'Share dhikr',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Dhikr ready to share')),
            );
          },
          child: const AzkarIcon(
            AzkarAssets.actionShare,
            width: 15,
            height: 16.667,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Material(
                color: AzkarPalette.emerald,
                borderRadius: BorderRadius.circular(9999),
                elevation: 1,
                shadowColor: const Color(0x0D000000),
                child: InkWell(
                  borderRadius: BorderRadius.circular(9999),
                  onTap: done ? null : onTapCount,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AzkarIcon(AzkarAssets.buttonCheck, width: 15),
                        const SizedBox(width: 8),
                        Text(
                          done
                              ? '${item.count} / ${item.repetitions} • Completed'
                              : '${item.count} / ${item.repetitions} • Tap to recite',
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
