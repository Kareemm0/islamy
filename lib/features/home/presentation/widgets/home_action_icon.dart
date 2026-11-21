import 'package:flutter/material.dart';

/// Compact 32x32 icon action button with tooltip used in home cards.
class HomeActionIcon extends StatelessWidget {
  const HomeActionIcon({
    super.key,
    required this.tooltip,
    required this.onTap,
    required this.child,
  });

  final String tooltip;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkResponse(
        onTap: onTap,
        radius: 18,
        child: SizedBox(width: 32, height: 32, child: Center(child: child)),
      ),
    );
  }
}
