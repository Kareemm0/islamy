import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'azkar_icon.dart';
import 'azkar_style.dart';

class AzkarTasbihButton extends StatelessWidget {
  const AzkarTasbihButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AzkarPalette.emerald,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.2),
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.goldAccent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const AzkarIcon(
                  AzkarAssets.tasbihBeads,
                  width: 13.537,
                  height: 14.973,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'TASBIH',
                    style: AppTheme.text(
                      size: 11,
                      weight: FontWeight.w600,
                      color: AppColors.goldAccent,
                      height: 16,
                      letterSpacing: 0.55,
                    ),
                  ),
                  Text(
                    '33 Beads',
                    style: AppTheme.text(
                      size: 13,
                      weight: FontWeight.w700,
                      color: Colors.white,
                      height: 13,
                      letterSpacing: 0.26,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              const AzkarIcon(
                AzkarAssets.tasbihChevron,
                width: 8.831,
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
