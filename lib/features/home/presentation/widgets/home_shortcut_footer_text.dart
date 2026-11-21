import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Small status caption shown at the bottom of a [HomeShortcutCard].
class HomeShortcutFooterText extends StatelessWidget {
  const HomeShortcutFooterText({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(
          size: 11,
          weight: FontWeight.w500,
          color: color,
          height: 16,
          letterSpacing: 0.44,
        ),
      ),
    );
  }
}
