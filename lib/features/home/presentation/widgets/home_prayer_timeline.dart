import 'package:flutter/material.dart';

import '../../domain/entities/home_prayer.dart';
import 'home_prayer_tile.dart';

/// Five-prayer horizontal timeline inside the home prayer card.
class HomePrayerTimeline extends StatelessWidget {
  const HomePrayerTimeline({
    super.key,
    required this.prayers,
    required this.nextPrayerIndex,
  });

  final List<HomePrayer> prayers;
  final int nextPrayerIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < prayers.length; i++) ...[
            if (i > 0) const SizedBox(width: 4.5),
            Expanded(
              child: HomePrayerTile(
                prayer: prayers[i],
                state: i < nextPrayerIndex
                    ? HomePrayerTileState.done
                    : i == nextPrayerIndex
                    ? HomePrayerTileState.active
                    : HomePrayerTileState.upcoming,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
