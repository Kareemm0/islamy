import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'quran_style.dart';

class QuranSearchBar extends StatelessWidget {
  const QuranSearchBar({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset(QuranAssets.searchIcon, width: 15, height: 15),
          const SizedBox(width: 13),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppTheme.text(size: 15),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: 'ابحث عن سورة أو رقمها...',
                hintMaxLines: 1,
                hintStyle: AppTheme.text(size: 15, color: AppColors.outline),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: QuranPalette.micBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              QuranAssets.micIcon,
              width: 11.083,
              height: 15.042,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
