import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/quran_ayah_entity.dart';
import 'surah_ayah_end_marker.dart';

/// Renders a Mushaf page of continuous, justified RTL ayahs with inline verse-end markers.
class SurahMushafPageCard extends StatelessWidget {
  const SurahMushafPageCard({
    super.key,
    required this.surahNumber,
    required this.pageNumber,
    required this.juzNumber,
    required this.ayahs,
  });

  final int surahNumber;
  final int pageNumber;
  final int juzNumber;
  final List<QuranAyah> ayahs;

  static const _bismillahPrefixes = [
    'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
  ];

  String _cleanAyahText(QuranAyah ayah) {
    var text = ayah.text.trim();
    if (ayah.numberInSurah == 1 && surahNumber != 1 && surahNumber != 9) {
      for (final prefix in _bismillahPrefixes) {
        if (text.startsWith(prefix)) {
          text = text.substring(prefix.length).trim();
          break;
        }
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldLight.withValues(alpha: 0.45),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text.rich(
              TextSpan(
                style: AppTheme.arabic(
                  size: 24,
                  weight: FontWeight.w400,
                  color: AppColors.onSurface,
                  height: 48,
                ),
                children: [
                  for (final ayah in ayahs) ...[
                    TextSpan(text: _cleanAyahText(ayah)),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SurahAyahEndMarker(number: ayah.numberInSurah),
                    ),
                    const TextSpan(text: ' '),
                  ],
                ],
              ),
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 14),
          Divider(
            height: 1,
            color: AppColors.goldLight.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Juz $juzNumber',
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.gold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLow,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  'Page $pageNumber',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
