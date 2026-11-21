import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Renders a downloaded home asset SVG at an explicit size.
class HomeSvg extends StatelessWidget {
  const HomeSvg(
    this.name, {
    super.key,
    required this.width,
    required this.height,
  });

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/home/$name.svg',
    width: width,
    height: height,
    fit: BoxFit.fill,
  );
}
