import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

class QuranEmptyState extends StatelessWidget {
  const QuranEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Text(
          'No surahs found',
          style: AppTheme.text(
            size: 13,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
