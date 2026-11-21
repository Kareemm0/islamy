import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';

/// Renders a Hadith SVG asset from `assets/images/hadith/`.
class HadithSvgIcon extends StatelessWidget {
  const HadithSvgIcon({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.color,
  });

  final String name;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        HadithAssets.svg(name),
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}
