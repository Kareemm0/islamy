import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/quran_surah_entity.dart';
import 'quran_friday_badge.dart';
import 'quran_revelation_badge.dart';
import 'quran_style.dart';

class QuranSurahTile extends StatelessWidget {
  const QuranSurahTile({
    super.key,
    required this.surah,
    required this.bookmarked,
    required this.onBookmark,
    this.onTap,
  });

  final QuranSurah surah;
  final bool bookmarked;
  final VoidCallback onBookmark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final madani = surah.revelation == SurahRevelation.madani;
    final revelation = madani ? 'Madani' : 'Makki';
    final subtitle = surah.isFridaySunnah
        ? '${surah.meaning} • ${surah.ayahCount} Ayahs • $revelation'
        : '${surah.meaning} • ${surah.ayahCount} Ayahs';
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
      elevation: 0.5,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      surah.isFridaySunnah
                          ? QuranAssets.surahMedalFeatured
                          : QuranAssets.surahMedal,
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      '${surah.number}',
                      style: AppTheme.text(
                        size: 11,
                        weight: FontWeight.w700,
                        color: AppColors.primary,
                        height: 16,
                        letterSpacing: 0.44,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          surah.name,
                          style: AppTheme.text(
                            size: 15,
                            weight: FontWeight.w700,
                            height: 20,
                            letterSpacing: 0.15,
                          ),
                        ),
                        if (surah.isFridaySunnah)
                          const QuranFridayBadge()
                        else
                          QuranRevelationBadge(
                            isMadani: madani,
                            label: revelation,
                          ),
                      ],
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.text(
                        size: 13,
                        color: AppColors.onSurfaceVariant,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              InkResponse(
                onTap: onBookmark,
                radius: 18,
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Center(
                    child: SvgPicture.asset(
                      bookmarked
                          ? QuranAssets.bookmarkFilled
                          : QuranAssets.bookmarkOutline,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                surah.arabicName,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: AppTheme.arabic(
                  size: 24,
                  weight: FontWeight.w700,
                  color: AppColors.primary,
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
