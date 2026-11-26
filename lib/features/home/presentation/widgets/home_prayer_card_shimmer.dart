import 'package:flutter/material.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

/// Shimmer skeleton displayed while prayer times are loading and not yet cached.
class HomePrayerCardShimmer extends StatelessWidget {
  const HomePrayerCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(width: 96, height: 22, radius: 999),
                ShimmerBox(width: 90, height: 24, radius: 999),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(width: 110, height: 32, radius: 8),
                    SizedBox(height: 6),
                    ShimmerBox(width: 140, height: 14, radius: 6),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShimmerBox(width: 56, height: 12, radius: 6),
                    SizedBox(height: 6),
                    ShimmerBox(width: 120, height: 34, radius: 8),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                for (var i = 0; i < 5; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  const Expanded(
                    child: ShimmerBox(
                      width: double.infinity,
                      height: 68,
                      radius: 12,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(width: 110, height: 16, radius: 6),
                ShimmerBox(width: 120, height: 16, radius: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
