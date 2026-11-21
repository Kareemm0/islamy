import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_spotlight_action_button.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_spotlight_blob.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// "Hadith of the Day" spotlight card.
class HadithSpotlightCard extends StatelessWidget {
  const HadithSpotlightCard({
    super.key,
    required this.hadith,
    required this.saved,
    required this.onCopy,
    required this.onSave,
    required this.onShare,
  });

  final HadithOfDay hadith;
  final bool saved;
  final VoidCallback onCopy;
  final VoidCallback onSave;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: HadithEffects.spotlightShadow,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            bottom: -40,
            child: HadithSpotlightBlob(
              size: 176,
              color: AppColors.goldAccent.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            left: -24,
            top: -24,
            child: HadithSpotlightBlob(
              size: 128,
              color: AppColors.mint.withValues(alpha: 0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const HadithSvgIcon(
                            name: 'spotlight_star',
                            width: 16.5,
                            height: 16.5,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'HADITH OF THE DAY',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w700,
                                color: AppColors.gold,
                                letterSpacing: 0.55,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
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
                            name: 'grade_badge',
                            width: 12.8,
                            height: 12.25,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            hadith.grade,
                            style: AppTheme.text(
                              size: 11,
                              weight: FontWeight.w600,
                              color: AppColors.mintSoft,
                              letterSpacing: 0.44,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: HadithPalette.arabicBoxBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    hadith.arabic,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppTheme.arabic(
                      size: 20,
                      weight: FontWeight.w700,
                      color: AppColors.primary,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 6.9),
                Text(
                  hadith.translation,
                  style: AppTheme.text(size: 15, height: 24.38).copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: HadithSvgIcon(
                          name: 'narrator_icon',
                          width: 14.7,
                          height: 12.6,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: AppTheme.text(
                              size: 13,
                              weight: FontWeight.w500,
                              color: AppColors.onSurfaceVariant,
                              height: 18,
                              letterSpacing: 0.26,
                            ),
                            children: [
                              const TextSpan(text: 'Narrated by '),
                              TextSpan(
                                text: hadith.narrator,
                                style: AppTheme.text(
                                  size: 13,
                                  weight: FontWeight.w600,
                                  height: 18,
                                  letterSpacing: 0.26,
                                ),
                              ),
                              TextSpan(
                                text: ' ${hadith.narratorArabic}',
                                style: AppTheme.text(
                                  size: 11,
                                  weight: FontWeight.w600,
                                  color: AppColors.gold,
                                  height: 16,
                                  letterSpacing: 0.44,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          hadith.source,
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w500,
                            color: HadithPalette.mutedMeta,
                            height: 16,
                            letterSpacing: 0.44,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const HadithSvgIcon(
                      name: 'book_icon',
                      width: 14.7,
                      height: 10.7,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        hadith.reference,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(
                          size: 11,
                          weight: FontWeight.w600,
                          color: AppColors.onSurfaceVariant,
                          height: 16,
                          letterSpacing: 0.44,
                        ),
                      ),
                    ),
                    HadithSpotlightActionButton(
                      asset: 'copy_hadith',
                      width: 28.75,
                      height: 37,
                      tooltip: 'Copy hadith',
                      onTap: onCopy,
                    ),
                    const SizedBox(width: 4),
                    HadithSpotlightActionButton(
                      asset: 'save_hadith',
                      width: 26.5,
                      height: 35.5,
                      tooltip: saved ? 'Unsave hadith' : 'Save hadith',
                      onTap: onSave,
                      color: saved ? AppColors.gold : null,
                    ),
                    const SizedBox(width: 4),
                    HadithSpotlightActionButton(
                      asset: 'share_hadith',
                      width: 29.5,
                      height: 37,
                      tooltip: 'Share hadith',
                      onTap: onShare,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
