import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// Search input with a filter button.
class HadithSearchBar extends StatelessWidget {
  const HadithSearchBar({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.filterActive,
    required this.onFilterTap,
  });

  final String hint;
  final ValueChanged<String> onChanged;
  final bool filterActive;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: HadithEffects.cardShadow,
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const HadithSvgIcon(name: 'search_icon', width: 15, height: 15),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppTheme.text(size: 15),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintMaxLines: 1,
                hintStyle: AppTheme.text(
                  size: 15,
                  color: HadithPalette.hintText,
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onFilterTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: HadithSvgIcon(
                name: 'filter_icon',
                width: 15,
                height: 15,
                color: filterActive ? AppColors.gold : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
