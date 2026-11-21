import 'package:flutter/material.dart';

/// Single-line LTR text that scales down to fit narrow prayer tiles.
class HomeScaledText extends StatelessWidget {
  const HomeScaledText({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text, style: style, textDirection: TextDirection.ltr),
    );
  }
}
