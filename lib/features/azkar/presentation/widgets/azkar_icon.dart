import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AzkarIcon extends StatelessWidget {
  const AzkarIcon(
    this.asset, {
    super.key,
    required this.width,
    this.height,
    this.color,
  });

  final String asset;
  final double width;
  final double? height;

  /// Optional tint (used by the selectable filter pills).
  final Color? color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    asset,
    width: width,
    height: height ?? width,
    colorFilter: color == null
        ? null
        : ColorFilter.mode(color!, BlendMode.srcIn),
  );
}
