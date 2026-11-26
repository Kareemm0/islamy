import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/home_prayer.dart';
import 'home_prayer_tile_icon.dart';
import 'home_scaled_text.dart';

/// Display state of a single prayer slot in the home prayer timeline.
enum HomePrayerTileState { done, active, upcoming }

/// Single prayer slot tile inside the home prayer timeline.
class HomePrayerTile extends StatelessWidget {
  const HomePrayerTile({
    super.key,
    required this.prayer,
    required this.state,
  });

  final HomePrayer prayer;
  final HomePrayerTileState state;

  @override
  Widget build(BuildContext context) {
    final active = state == HomePrayerTileState.active;
    final upcoming = state == HomePrayerTileState.upcoming;
    final nameColor = active ? const Color(0xFF745C00) : Colors.white;

    final tile = Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: active
            ? AppColors.goldAccent
            : Colors.white.withValues(alpha: upcoming ? 0.05 : 0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: active
            ? const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 6,
                  offset: Offset(0, 4),
                  spreadRadius: -1,
                ),
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: -2,
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomePrayerTileIcon(state: state),
          const SizedBox(height: 4),
          Text(
            prayer.arabicName,
            textDirection: TextDirection.rtl,
            style: AppTheme.arabic(
              size: 11,
              weight: active ? FontWeight.w700 : FontWeight.w600,
              color: nameColor,
              height: 16,
            ),
          ),
          const SizedBox(height: 3),
          HomeScaledText(
            text: prayer.time,
            style: AppTheme.text(
              size: 11,
              weight: active ? FontWeight.w700 : FontWeight.w500,
              color: nameColor,
              height: 16.5,
            ),
          ),
        ],
      ),
    );

    if (active) return Transform.scale(scale: 1.05, child: tile);
    return Opacity(opacity: upcoming ? 0.8 : 1, child: tile);
  }
}
