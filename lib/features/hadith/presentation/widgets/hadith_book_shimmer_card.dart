import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_colors.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

class HadithBookShimmerCard extends StatelessWidget {
  const HadithBookShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerBox(width: 44, height: 44, radius: 12),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(width: 140, height: 16, radius: 6),
                    SizedBox(height: 8),
                    ShimmerBox(width: 100, height: 12, radius: 6),
                  ],
                ),
              ),
              ShimmerBox(width: 80, height: 22, radius: 6),
            ],
          ),
          SizedBox(height: 12),
          ShimmerBox(width: double.infinity, height: 12, radius: 6),
          SizedBox(height: 6),
          ShimmerBox(width: 220, height: 12, radius: 6),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBox(width: 90, height: 22, radius: 999),
              ShimmerBox(width: 72, height: 16, radius: 6),
            ],
          ),
        ],
      ),
    );
  }
}
