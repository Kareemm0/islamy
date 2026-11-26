import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/bookmark_cubit.dart';
import 'quran_style.dart';

class QuranLastReadCard extends StatelessWidget {
  const QuranLastReadCard({super.key, this.bookmark, this.onContinue});

  final QuranBookmark? bookmark;

  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: QuranPalette.lastReadGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 10),
            spreadRadius: -3,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            bottom: -32,
            child: Opacity(
              opacity: 0.15,
              child: SvgPicture.asset(
                QuranAssets.heroMotif,
                width: 210,
                height: 230,
              ),
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
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.goldAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'آخر موضع محفوظ',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.text(
                                size: 11,
                                weight: FontWeight.w600,
                                color: QuranPalette.mintText,
                                height: 16,
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
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Text(
                        bookmark == null ? '' : 'صفحة ${bookmark!.page}',
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
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookmark?.arabicName ?? 'لا توجد علامة محفوظة',
                            style: AppTheme.text(
                              size: 20,
                              weight: FontWeight.w700,
                              color: Colors.white,
                              height: 28,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            bookmark == null
                                ? 'اضغط على أيقونة العلامة داخل السورة'
                                : 'الجزء ${bookmark!.juz} • الآية ${bookmark!.firstAyah}',
                            style: AppTheme.text(
                              size: 13,
                              color: QuranPalette.mintText,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      bookmark == null ? '' : 'سورة',
                      textDirection: TextDirection.rtl,
                      style: AppTheme.arabic(
                        size: 26,
                        weight: FontWeight.w700,
                        color: AppColors.goldContainer,
                        height: 32.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(9999),
                  child: Stack(
                    children: [
                      Container(
                        height: 6,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      FractionallySizedBox(
                        widthFactor: bookmark?.progress ?? 0.0,
                        child: Container(
                          height: 6,
                          color: AppColors.goldAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        bookmark == null
                            ? ''
                            : 'الآية ${bookmark!.firstAyah} من ${bookmark!.totalAyahs}',
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(
                          size: 11,
                          weight: FontWeight.w600,
                          color: QuranPalette.verseInfoText,
                          height: 16,
                          letterSpacing: 0.44,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Material(
                      color: AppColors.goldAccent,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: onContinue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'متابعة',
                                style: AppTheme.text(
                                  size: 13,
                                  weight: FontWeight.w600,
                                  color: AppColors.gold,
                                  height: 18,
                                  letterSpacing: 0.26,
                                ),
                              ),
                              const SizedBox(width: 6),
                              SvgPicture.asset(
                                QuranAssets.arrowForward,
                                width: 14.667,
                                height: 10.667,
                              ),
                            ],
                          ),
                        ),
                      ),
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
