import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// Dark hero card for the featured collection.
class HadithHeroBookCard extends StatelessWidget {
  const HadithHeroBookCard({super.key, required this.book, this.onTap});

  final HadithBook book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      elevation: 3,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              width: 96,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      HadithPalette.darkGreen.withValues(alpha: 0.8),
                      HadithPalette.darkGreen.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
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
                          color: AppColors.goldAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${book.number}',
                          style: AppTheme.text(
                            size: 13,
                            weight: FontWeight.w700,
                            color: HadithPalette.heroBadgeText,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.arabicName,
                              textDirection: TextDirection.rtl,
                              style: AppTheme.arabic(
                                size: 22,
                                weight: FontWeight.w700,
                                color: Colors.white,
                                height: 28,
                              ),
                            ),
                            Text(
                              book.author,
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w600,
                                color: HadithPalette.heroLightText,
                                height: 16,
                                letterSpacing: 0.44,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    book.description,
                    style: AppTheme.text(
                      size: 13,
                      color: HadithPalette.heroDescription,
                      height: 17.88,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: HadithPalette.darkGreen,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const HadithSvgIcon(
                              name: 'verified_badge',
                              width: 9.3,
                              height: 11.7,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              book.tag,
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w600,
                                color: HadithPalette.heroLightText,
                                height: 16,
                                letterSpacing: 0.44,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0.8,
                        child: Text(
                          book.sectionCount,
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w600,
                            color: AppColors.mint,
                            height: 16,
                            letterSpacing: 0.44,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        book.hadithCount,
                        style: AppTheme.text(
                          size: 13,
                          weight: FontWeight.w700,
                          color: AppColors.goldContainer,
                          height: 18,
                          letterSpacing: 0.26,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Opacity(
                        opacity: 0.75,
                        child: Text(
                          'حديث',
                          style: AppTheme.text(
                            size: 12,
                            weight: FontWeight.w500,
                            color: AppColors.goldContainer,
                            height: 18,
                            letterSpacing: 0.26,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const HadithSvgIcon(
                        name: 'chevron_hero',
                        width: 6.9,
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
