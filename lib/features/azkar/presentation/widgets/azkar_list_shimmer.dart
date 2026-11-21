import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_colors.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

class AzkarListShimmer extends StatelessWidget {
  const AzkarListShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            for (var i = 0; i < itemCount; i++) ...[
              if (i > 0) const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ShimmerBox(width: 28, height: 28, isCircle: true),
                        SizedBox(width: 8),
                        ShimmerBox(width: 110, height: 20, radius: 999),
                        Spacer(),
                        ShimmerBox(width: 84, height: 20, radius: 999),
                      ],
                    ),
                    SizedBox(height: 15),
                    ShimmerBox(width: double.infinity, height: 96, radius: 8),
                    SizedBox(height: 12),
                    ShimmerBox(width: double.infinity, height: 14, radius: 6),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        ShimmerBox(width: 36, height: 36, isCircle: true),
                        SizedBox(width: 8),
                        ShimmerBox(width: 36, height: 36, isCircle: true),
                        Spacer(),
                        ShimmerBox(width: 140, height: 40, radius: 999),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
