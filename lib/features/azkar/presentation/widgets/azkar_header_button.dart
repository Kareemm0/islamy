import 'package:flutter/material.dart';

class AzkarHeaderButton extends StatelessWidget {
  const AzkarHeaderButton({
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
        radius: 22,
        child: SizedBox(width: 44, height: 44, child: Center(child: child)),
      ),
    );
  }
}
