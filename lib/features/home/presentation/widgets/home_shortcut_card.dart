import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'home_style.dart';

/// Single card inside the 2x2 Quick Essentials shortcut grid.
class HomeShortcutCard extends StatelessWidget {
  const HomeShortcutCard({
    super.key,
    required this.iconBg,
    required this.icon,
    required this.trailing,
    required this.title,
    required this.subtitle,
    required this.footer,
    this.onTap,
  });

  final Color iconBg;
  final Widget icon;
  final Widget trailing;
  final String title;
  final String subtitle;
  final Widget footer;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: HomeStyle.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: icon,
                ),
                trailing,
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(
                size: 15,
                weight: FontWeight.w700,
                height: 20,
                letterSpacing: 0.15,
              ),
            ),
            Text(
              subtitle,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(
                size: 13,
                color: AppColors.onSurfaceVariant,
                height: 18,
              ),
            ),
            const Spacer(),
            footer,
          ],
        ),
      ),
    );
  }
}
