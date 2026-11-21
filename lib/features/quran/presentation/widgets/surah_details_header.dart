import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/quran_surah_entity.dart';

class SurahDetailsHeader extends StatelessWidget {
  const SurahDetailsHeader({super.key, required this.surah});

  final QuranSurah surah;

  @override
  Widget build(BuildContext context) {
    final revelation = surah.revelation == SurahRevelation.madani
        ? 'Madani'
        : 'Makki';
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            Color(0xFF0D5C3A),
            AppColors.primaryContainer,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F004328),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Material(
                color: Colors.white.withValues(alpha: 0.14),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => context.pop(),
                  child: const SizedBox(
                    width: 38,
                    height: 38,
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.goldAccent,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  'Surah ${surah.number}',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w700,
                    color: AppColors.gold,
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            surah.arabicName,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTheme.arabic(
              size: 32,
              weight: FontWeight.w700,
              color: AppColors.goldContainer,
              height: 44,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            surah.name,
            textAlign: TextAlign.center,
            style: AppTheme.text(
              size: 20,
              weight: FontWeight.w700,
              color: Colors.white,
              height: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${surah.meaning} • $revelation • ${surah.ayahCount} Ayahs',
            textAlign: TextAlign.center,
            style: AppTheme.text(
              size: 13,
              color: AppColors.mintSoft,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }
}
