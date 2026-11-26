import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'azkar_style.dart';

class AzkarSearchField extends StatelessWidget {
  const AzkarSearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: onChanged,
      style: AppTheme.text(size: 13),
      decoration: InputDecoration(
        hintText: 'ابحث في الأذكار…',
        hintStyle: AppTheme.text(
          size: 13,
          color: AzkarPalette.outlineVariant,
        ),
        filled: true,
        fillColor: AppColors.surfaceContainer,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9999),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
