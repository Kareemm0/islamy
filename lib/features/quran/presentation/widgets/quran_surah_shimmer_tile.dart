import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_colors.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

class QuranSurahShimmerTile extends StatelessWidget {
  const QuranSurahShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          ShimmerBox(width: 40, height: 40, isCircle: true),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShimmerBox(width: 96, height: 15, radius: 6),
                    SizedBox(width: 8),
                    ShimmerBox(width: 48, height: 16, radius: 999),
                  ],
                ),
                SizedBox(height: 8),
                ShimmerBox(width: 150, height: 12, radius: 6),
              ],
            ),
          ),
          SizedBox(width: 12),
          ShimmerBox(width: 64, height: 22, radius: 6),
        ],
      ),
    );
  }
}
