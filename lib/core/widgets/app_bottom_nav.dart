import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Persistent 5-tab bottom navigation bar shared across the app shell.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  static const _items = [
    (Icons.home_rounded, Icons.home_outlined, 'الرئيسية'),
    (Icons.menu_book_rounded, Icons.menu_book_outlined, 'القرآن'),
    (Icons.auto_awesome_rounded, Icons.auto_awesome_outlined, 'الأذكار'),
    (Icons.format_quote_rounded, Icons.format_quote_outlined, 'الحديث'),
    (Icons.settings_rounded, Icons.settings_outlined, 'الإعدادات'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        border: const Border(top: BorderSide(color: AppColors.surfaceContainer)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: InkWell(
                    onTap: () => onSelected(i),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          i == currentIndex ? _items[i].$1 : _items[i].$2,
                          size: 24,
                          color: i == currentIndex
                              ? AppColors.primary
                              : AppColors.onSurfaceVariant,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _items[i].$3,
                          style: AppTheme.text(
                            size: 11,
                            weight: i == currentIndex
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: i == currentIndex
                                ? AppColors.primary
                                : AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
