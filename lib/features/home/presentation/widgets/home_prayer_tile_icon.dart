import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import 'home_prayer_tile.dart';
import 'home_svg.dart';

/// Circular status icon displayed at the top of a prayer timeline tile.
class HomePrayerTileIcon extends StatelessWidget {
  const HomePrayerTileIcon({super.key, required this.state});

  final HomePrayerTileState state;

  @override
  Widget build(BuildContext context) {
    final (Color fill, Widget icon) = switch (state) {
      HomePrayerTileState.done => (
        const Color(0xFFA6F2CF),
        const HomeSvg('icon_prayer_done', width: 8.95, height: 6.825),
      ),
      HomePrayerTileState.active => (
        AppColors.gold,
        const HomeSvg('icon_prayer_active', width: 10, height: 10),
      ),
      HomePrayerTileState.upcoming => (
        Colors.white.withValues(alpha: 0.2),
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.outline,
            shape: BoxShape.circle,
          ),
        ),
      ),
    };

    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: fill, shape: BoxShape.circle),
      child: icon,
    );
  }
}
