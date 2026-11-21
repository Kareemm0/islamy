import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'home_style.dart';
import 'home_svg.dart';

/// Top header row of the home prayer card with "NEXT PRAYER" badge and Athan toggle.
class HomePrayerCardTopRow extends StatelessWidget {
  const HomePrayerCardTopRow({
    super.key,
    required this.athanActive,
    required this.onToggleAthan,
  });

  final bool athanActive;
  final VoidCallback onToggleAthan;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldAccent,
                    borderRadius: BorderRadius.circular(9999),
                    boxShadow: HomeStyle.cardShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          'NEXT PRAYER',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w700,
                            color: const Color(0xFF745C00),
                            height: 16,
                            letterSpacing: 0.44,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'الصلاة القادمة',
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(
                    size: 13,
                    weight: FontWeight.w500,
                    color: AppColors.mintSoft,
                    height: 18,
                    letterSpacing: 0.26,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onToggleAthan,
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: athanActive ? 0.15 : 0.06),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: athanActive ? 1 : 0.5,
                  child: const HomeSvg(
                    'icon_athan_active',
                    width: 12,
                    height: 11.667,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  athanActive ? 'Athan Active' : 'Athan Muted',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w600,
                    color: Colors.white,
                    height: 16,
                    letterSpacing: 0.44,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
