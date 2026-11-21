import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/home_state.dart';
import 'home_shortcut_card.dart';
import 'home_shortcut_footer_text.dart';
import 'home_shortcut_trailing.dart';
import 'home_svg.dart';

/// "Quick Essentials" heading + 2x2 shortcut grid.
class HomeShortcuts extends StatelessWidget {
  const HomeShortcuts({
    super.key,
    required this.state,
    required this.onIncrementTasbih,
  });

  final HomeState state;
  final VoidCallback onIncrementTasbih;

  @override
  Widget build(BuildContext context) {
    final quran = HomeShortcutCard(
      iconBg: AppColors.mint,
      icon: const HomeSvg('icon_shortcut_quran', width: 20.167, height: 14.667),
      trailing: HomeShortcutTrailing(
        'Ayah ${state.lastReadAyah}',
        AppColors.gold,
        FontWeight.w700,
        pill: false,
      ),
      title: state.lastReadSurah,
      subtitle: '${state.lastReadSurahAr} • Page ${state.lastReadPage}',
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: LinearProgressIndicator(
          value: state.lastReadProgress,
          minHeight: 4,
          backgroundColor: AppColors.surfaceContainer,
          valueColor: const AlwaysStoppedAnimation(AppColors.primary),
        ),
      ),
    );
    final tasbih = HomeShortcutCard(
      iconBg: AppColors.goldContainer,
      icon: const HomeSvg(
        'icon_shortcut_tasbih',
        width: 16.545,
        height: 18.301,
      ),
      trailing: HomeShortcutTrailing(
        '${state.tasbihCount}x',
        AppColors.primary,
        FontWeight.w600,
        pill: true,
        pillColor: AppColors.surfaceLow,
      ),
      title: 'Electronic Tasbih',
      subtitle: 'المسبحة الإلكترونية',
      footer: const HomeShortcutFooterText(
        text: 'Tap to recite',
        color: AppColors.gold,
      ),
      onTap: onIncrementTasbih,
    );
    final qibla = HomeShortcutCard(
      iconBg: const Color(0xFFA6F2CF),
      icon: const HomeSvg('icon_shortcut_qibla', width: 18.333, height: 18.333),
      trailing: HomeShortcutTrailing(
        '${state.qiblaDegrees}°',
        AppColors.primary,
        FontWeight.w700,
        pill: true,
        pillColor: AppColors.mint,
      ),
      title: 'Qibla Direction',
      subtitle: 'بوصلة اتجاه القبلة',
      footer: const HomeShortcutFooterText(
        text: 'Calibrated',
        color: Color(0xFF00422E),
      ),
    );
    final hadith = HomeShortcutCard(
      iconBg: AppColors.surfaceContainer,
      icon: const HomeSvg('icon_shortcut_hadith', width: 20.167, height: 17.875),
      trailing: const HomeShortcutTrailing(
        'Bukhari',
        AppColors.onSurfaceVariant,
        FontWeight.w500,
        pill: false,
      ),
      title: 'Hadith Library',
      subtitle: 'رياض الصالحين والسنن',
      footer: const HomeShortcutFooterText(
        text: 'Daily selection',
        color: AppColors.gold,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Quick Essentials',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.text(
                  size: 20,
                  weight: FontWeight.w700,
                  height: 28,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'وصول سريع',
              textDirection: TextDirection.rtl,
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
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: quran),
              const SizedBox(width: 8),
              Expanded(child: tasbih),
            ],
          ),
        ),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: qibla),
              const SizedBox(width: 8),
              Expanded(child: hadith),
            ],
          ),
        ),
      ],
    );
  }
}
