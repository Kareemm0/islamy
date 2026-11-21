import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

class AzkarCircleAction extends StatelessWidget {
  const AzkarCircleAction({
    super.key,
    required this.tooltip,
    required this.onTap,
    required this.child,
    this.size = 36,
  });

  final String tooltip;
  final VoidCallback onTap;
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkResponse(
        onTap: onTap,
        radius: size / 2,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppColors.surfaceLow,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
