import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranHeaderIcon extends StatelessWidget {
  const QuranHeaderIcon({
    super.key,
    required this.asset,
    required this.width,
    required this.height,
  });

  final String asset;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Center(
        child: SvgPicture.asset(asset, width: width, height: height),
      ),
    );
  }
}
