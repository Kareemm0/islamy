import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_colors.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

class SurahDetailsShimmer extends StatelessWidget {
  const SurahDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const ShimmerBox(width: double.infinity, height: 156, radius: 18),
          const SizedBox(height: 16),
          const ShimmerBox(width: double.infinity, height: 56, radius: 14),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShimmerBox(width: double.infinity, height: 22, radius: 6),
                SizedBox(height: 14),
                ShimmerBox(width: double.infinity, height: 22, radius: 6),
                SizedBox(height: 14),
                ShimmerBox(width: double.infinity, height: 22, radius: 6),
                SizedBox(height: 14),
                ShimmerBox(width: double.infinity, height: 22, radius: 6),
                SizedBox(height: 14),
                ShimmerBox(width: 240, height: 22, radius: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
