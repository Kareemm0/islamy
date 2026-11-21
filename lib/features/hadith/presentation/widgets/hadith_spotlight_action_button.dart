import 'package:flutter/material.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// Icon action button (copy, save, share) in the Hadith spotlight card.
class HadithSpotlightActionButton extends StatelessWidget {
  const HadithSpotlightActionButton({
    super.key,
    required this.asset,
    required this.width,
    required this.height,
    required this.tooltip,
    required this.onTap,
    this.color,
  });

  final String asset;
  final double width;
  final double height;
  final String tooltip;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: HadithSvgIcon(
          name: asset,
          width: width,
          height: height,
          color: color,
        ),
      ),
    );
  }
}
