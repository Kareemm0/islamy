import 'package:flutter/material.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';

import 'quran_surah_shimmer_tile.dart';

class QuranSurahListShimmer extends StatelessWidget {
  const QuranSurahListShimmer({super.key, this.itemCount = 7});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          for (var i = 0; i < itemCount; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            const QuranSurahShimmerTile(),
          ],
        ],
      ),
    );
  }
}
