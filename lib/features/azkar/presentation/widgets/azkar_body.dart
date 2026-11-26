import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/azkar_cubit.dart';
import '../cubit/azkar_state.dart';
import 'azkar_banner.dart';
import 'azkar_category_pills.dart';
import 'azkar_dhikr_card.dart';
import 'azkar_error_view.dart';
import 'azkar_header.dart';
import 'azkar_list_shimmer.dart';
import 'azkar_progress_card.dart';
import 'azkar_search_field.dart';
import 'azkar_wisdom_card.dart';

class AzkarBody extends StatelessWidget {
  const AzkarBody({super.key, required this.state, required this.onOpenTasbih});

  final AzkarState state;
  final VoidCallback onOpenTasbih;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AzkarCubit>();
    final items = state.visibleItems;
    return Stack(
      children: [
        Column(
          children: [
            AzkarHeader(
              searching: state.searching,
              onToggleSearch: cubit.toggleSearch,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12, bottom: 96),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.searching) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AzkarSearchField(onChanged: cubit.setQuery),
                      ),
                      const SizedBox(height: 12),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AzkarBanner(category: state.category),
                    ),
                    const SizedBox(height: 16),
                    AzkarCategoryPills(
                      selected: state.category,
                      onSelected: cubit.selectCategory,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AzkarProgressCard(
                        state: state,
                        onResetProgress: cubit.resetProgress,
                        onTogglePlayAll: cubit.togglePlayAll,
                      ),
                    ),
                    const SizedBox(height: 20),
                    switch (state.status) {
                      AzkarStatus.initial ||
                      AzkarStatus.loading => const AzkarListShimmer(),
                      AzkarStatus.failure => AzkarErrorView(
                        message: state.errorMessage ?? 'Could not load azkar.',
                        onRetry: cubit.loadAzkar,
                      ),
                      AzkarStatus.success => switch (items.isEmpty) {
                        true => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 32,
                          ),
                          child: Center(
                            child: Text(
                              'No adhkar match your search.',
                              style: AppTheme.text(
                                size: 14,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                        false => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              for (var i = 0; i < items.length; i++) ...[
                                if (i > 0) const SizedBox(height: 16),
                                AzkarDhikrCard(
                                  number: state.numberOf(items[i]),
                                  item: items[i],
                                  onTapCount: () => cubit.tap(items[i]),
                                  onReread: () => cubit.reread(items[i]),
                                ),
                              ],
                            ],
                          ),
                        ),
                      },
                    },
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AzkarWisdomCard(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
