import 'package:flutter/material.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';

/// Soft blurred decorative circle used in the Hadith spotlight card background.
class HadithSpotlightBlob extends StatelessWidget {
  const HadithSpotlightBlob({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: HadithEffects.spotlightBlur,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
