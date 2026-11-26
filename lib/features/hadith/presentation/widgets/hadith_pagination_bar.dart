import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';

class HadithPaginationBar extends StatelessWidget {
  const HadithPaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pages,
    required this.limit,
    required this.hasPrevious,
    required this.hasNext,
    required this.onSelectPage,
    required this.onChangeLimit,
  });

  final int currentPage;
  final int totalPages;
  final List<int> pages;
  final int limit;
  final bool hasPrevious;
  final bool hasNext;
  final ValueChanged<int> onSelectPage;
  final ValueChanged<int> onChangeLimit;

  static const _limits = [20, 50, 100, 300];

  @override
  Widget build(BuildContext context) {
    final visiblePages = pages.isEmpty ? [currentPage] : pages;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.surfaceContainer),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                tooltip: 'الصفحة السابقة',
                visualDensity: VisualDensity.compact,
                onPressed:
                    hasPrevious ? () => onSelectPage(currentPage - 1) : null,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: visiblePages.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      final p = visiblePages[index];
                      final selected = p == currentPage;
                      return GestureDetector(
                        onTap: () => onSelectPage(p),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary
                                : AppColors.surfaceLow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$p',
                            style: AppTheme.text(
                              size: 12,
                              weight: FontWeight.w700,
                              color: selected
                                  ? Colors.white
                                  : AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                tooltip: 'الصفحة التالية',
                visualDensity: VisualDensity.compact,
                onPressed: hasNext ? () => onSelectPage(currentPage + 1) : null,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'صفحة $currentPage من $totalPages',
                style: AppTheme.text(
                  size: 11,
                  weight: FontWeight.w600,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Wrap(
                spacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'في الصفحة:',
                    style: AppTheme.text(
                      size: 11,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  for (final option in _limits)
                    GestureDetector(
                      onTap: () => onChangeLimit(option),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: option == limit
                              ? AppColors.goldContainer
                              : AppColors.surfaceLow,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '$option',
                          style: AppTheme.text(
                            size: 11,
                            weight: FontWeight.w700,
                            color: option == limit
                                ? AppColors.gold
                                : AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
