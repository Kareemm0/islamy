import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Individual Morning / Evening pill button inside [HomeAzkarCard].
class HomeAzkarSegment extends StatelessWidget {
  const HomeAzkarSegment({
    super.key,
    required this.label,
    required this.selected,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTheme.text(
                size: 11,
                weight: FontWeight.w600,
                color: selected ? Colors.white : AppColors.onSurfaceVariant,
                height: 16,
                letterSpacing: 0.44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
