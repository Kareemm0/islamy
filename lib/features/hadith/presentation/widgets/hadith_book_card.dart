import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// White list card for a regular collection.
class HadithBookCard extends StatelessWidget {
  const HadithBookCard({super.key, required this.book, this.onTap});

  final HadithBook book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tagStyle = _tagStyle(book.tag);
    return Material(
      color: Colors.white,
      elevation: 0.5,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${book.number}',
                      style: AppTheme.text(
                        size: 13,
                        weight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.name,
                          style: AppTheme.text(
                            size: 15,
                            weight: FontWeight.w700,
                            height: 20,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Text(
                          book.author,
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w600,
                            color: AppColors.onSurfaceVariant,
                            height: 16,
                            letterSpacing: 0.44,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    book.arabicName,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: AppTheme.arabic(
                      size: 20,
                      weight: FontWeight.w700,
                      color: AppColors.gold,
                      height: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                book.description,
                style: AppTheme.text(
                  size: 13,
                  color: AppColors.onSurfaceVariant,
                  height: 21.13,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: tagStyle.$1,
                            borderRadius: BorderRadius.circular(9999),
                          ),
                          child: Text(
                            book.tag,
                            style: AppTheme.text(
                              size: 11,
                              weight: tagStyle.$3,
                              color: tagStyle.$2,
                              height: 16,
                              letterSpacing: 0.44,
                            ),
                          ),
                        ),
                        Text(
                          book.sectionCount,
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w600,
                            color: HadithPalette.mutedMeta,
                            height: 16,
                            letterSpacing: 0.44,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${book.hadithCount} Hadiths',
                    style: AppTheme.text(
                      size: 13,
                      weight: FontWeight.w600,
                      color: AppColors.primary,
                      height: 18,
                      letterSpacing: 0.26,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const HadithSvgIcon(
                    name: 'chevron_small',
                    width: 4.9,
                    height: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// (background, text color, weight)
  (Color, Color, FontWeight) _tagStyle(String tag) {
    if (tag.contains('Sahih')) {
      return (AppColors.mint, HadithPalette.sahihTagText, FontWeight.w500);
    }
    if (tag.contains('Grading')) {
      return (
        AppColors.goldContainer,
        HadithPalette.gradingTagText,
        FontWeight.w600,
      );
    }
    return (AppColors.surfaceLow, AppColors.onSurfaceVariant, FontWeight.w500);
  }
}
