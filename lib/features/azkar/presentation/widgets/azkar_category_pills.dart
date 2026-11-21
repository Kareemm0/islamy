import 'package:flutter/material.dart';

import '../../domain/entities/azkar_category.dart';
import 'azkar_category_pill.dart';

class AzkarCategoryPills extends StatelessWidget {
  const AzkarCategoryPills({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final AzkarCategory selected;
  final ValueChanged<AzkarCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: AzkarCategory.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => AzkarCategoryPill(
          category: AzkarCategory.values[index],
          selected: AzkarCategory.values[index] == selected,
          onTap: () => onSelected(AzkarCategory.values[index]),
        ),
      ),
    );
  }
}
