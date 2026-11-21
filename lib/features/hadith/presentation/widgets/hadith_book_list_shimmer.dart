import 'package:flutter/material.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';

import 'hadith_book_shimmer_card.dart';

class HadithBookListShimmer extends StatelessWidget {
  const HadithBookListShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          for (var i = 0; i < itemCount; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            const HadithBookShimmerCard(),
          ],
        ],
      ),
    );
  }
}
