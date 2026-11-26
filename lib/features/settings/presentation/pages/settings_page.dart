import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Placeholder settings tab.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: Center(
        child: Text(
          'الإعدادات',
          style: AppTheme.text(
            size: 18,
            weight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
