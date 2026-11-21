import 'package:flutter/material.dart';

import '../cubit/home_state.dart';
import 'home_prayer_card_footer.dart';
import 'home_prayer_card_top_row.dart';
import 'home_prayer_countdown_row.dart';
import 'home_prayer_timeline.dart';
import 'home_svg.dart';

/// Gradient "Next prayer" hero card with the 5-prayer timeline.
class HomePrayerCard extends StatelessWidget {
  const HomePrayerCard({
    super.key,
    required this.state,
    required this.onToggleAthan,
  });

  final HomeState state;
  final VoidCallback onToggleAthan;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment(-0.64, -0.77),
          end: Alignment(0.64, 0.77),
          colors: [Color(0xFF004328), Color(0xFF0D5C3A), Color(0xFF00422E)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 25,
            offset: Offset(0, 20),
            spreadRadius: -5,
          ),
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 8),
            spreadRadius: -6,
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -40,
            bottom: -40,
            child: Opacity(
              opacity: 0.1,
              child: HomeSvg(
                'hero_geometry_backdrop',
                width: 192,
                height: 192,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomePrayerCardTopRow(
                  athanActive: state.athanActive,
                  onToggleAthan: onToggleAthan,
                ),
                const SizedBox(height: 16),
                HomePrayerCountdownRow(
                  nextPrayer: state.nextPrayer,
                  remainingText: state.remainingText,
                ),
                const SizedBox(height: 16),
                HomePrayerTimeline(
                  prayers: state.prayers,
                  nextPrayerIndex: state.nextPrayerIndex,
                ),
                const SizedBox(height: 16),
                HomePrayerCardFooter(qiblaDegrees: state.qiblaDegrees),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
