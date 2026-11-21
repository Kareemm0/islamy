import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_colors.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

class HadithDetailsShimmer extends StatelessWidget {
  const HadithDetailsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const ShimmerBox(width: double.infinity, height: 136, radius: 18),
          const SizedBox(height: 14),
          const ShimmerBox(width: double.infinity, height: 52, radius: 14),
          const SizedBox(height: 14),
          for (var i = 0; i < itemCount; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBox(width: 88, height: 26, radius: 999),
                      ShimmerBox(width: 28, height: 28, isCircle: true),
                    ],
                  ),
                  SizedBox(height: 14),
                  ShimmerBox(width: double.infinity, height: 84, radius: 12),
                  SizedBox(height: 12),
                  ShimmerBox(width: double.infinity, height: 14, radius: 6),
                  SizedBox(height: 8),
                  ShimmerBox(width: 200, height: 14, radius: 6),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
