import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Trailing label or pill badge displayed in the top-right of [HomeShortcutCard].
class HomeShortcutTrailing extends StatelessWidget {
  const HomeShortcutTrailing(
    this.text,
    this.color,
    this.weight, {
    super.key,
    required this.pill,
    this.pillColor,
  });

  final String text;
  final Color color;
  final FontWeight weight;
  final bool pill;
  final Color? pillColor;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      text,
      style: AppTheme.text(
        size: 11,
        weight: weight,
        color: color,
        height: 16,
        letterSpacing: 0.44,
      ),
    );
    if (!pill) return label;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: pillColor,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: label,
    );
  }
}
