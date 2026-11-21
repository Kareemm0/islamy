import 'package:flutter/material.dart';

/// Fixed-size tap target wrapper for home header icon buttons.
class HomeHeaderIconButton extends StatelessWidget {
  const HomeHeaderIconButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Center(child: child),
    );
  }
}
