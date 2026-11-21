import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// Top header bar for the Hadith tab.
class HadithHeader extends StatelessWidget {
  const HadithHeader({super.key, this.onNotificationsTap});

  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Islamy',
              style: AppTheme.text(
                size: 22,
                weight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: -0.5,
              ),
            ),
          ),
          SizedBox(
            width: 44,
            height: 44,
            child: IconButton(
              tooltip: 'Notifications',
              onPressed: onNotificationsTap ?? () {},
              icon: const HadithSvgIcon(
                name: 'notifications',
                width: 14.7,
                height: 18.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
