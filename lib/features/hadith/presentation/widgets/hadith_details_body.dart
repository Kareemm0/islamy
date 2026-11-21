import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/core/widgets/app_shimmer.dart';
import 'package:islamy/core/widgets/shimmer_box.dart';

import '../cubit/hadith_details_cubit.dart';
import '../cubit/hadith_details_state.dart';
import 'hadith_details_header.dart';
import 'hadith_details_shimmer.dart';
import 'hadith_error_view.dart';
import 'hadith_item_card.dart';
import 'hadith_pagination_bar.dart';

class HadithDetailsBody extends StatelessWidget {
  const HadithDetailsBody({super.key, required this.state});

  final HadithDetailsState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HadithDetailsCubit>();
    return switch (state.status) {
      HadithDetailsStatus.initial || HadithDetailsStatus.loading => Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primary,
              ),
              onPressed: () => context.pop(),
            ),
            title: Text(
              state.bookName,
              style: AppTheme.text(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          body: const HadithDetailsShimmer(),
        ),
      HadithDetailsStatus.failure => Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primary,
              ),
              onPressed: () => context.pop(),
            ),
            title: Text(
              state.bookName,
              style: AppTheme.text(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          body: Center(
            child: HadithErrorView(
              message: state.errorMessage ?? 'Could not load hadiths.',
              onRetry: cubit.retry,
            ),
          ),
        ),
      HadithDetailsStatus.success => Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HadithDetailsHeader(
                    bookName: state.bookName,
                    slug: state.slug,
                    total: state.total,
                    currentPage: state.currentPage,
                    totalPages: state.totalPages,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HadithPaginationBar(
                    currentPage: state.currentPage,
                    totalPages: state.totalPages,
                    pages: state.pages,
                    limit: state.limit,
                    hasPrevious: state.hasPreviousPage,
                    hasNext: state.hasNextPage,
                    onSelectPage: cubit.loadPage,
                    onChangeLimit: cubit.changeLimit,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverList.separated(
                    itemCount: state.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => HadithItemCard(
                      bookName: state.bookName,
                      item: state.items[index],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                    child: switch (state.isLoadingMore) {
                      true => const AppShimmer(
                          child: ShimmerBox(
                            width: double.infinity,
                            height: 48,
                            radius: 999,
                          ),
                        ),
                      false => switch (state.hasNextPage) {
                          true => FilledButton.icon(
                              onPressed: cubit.loadNextPage,
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: const StadiumBorder(),
                              ),
                              icon: const Icon(Icons.expand_more_rounded),
                              label: Text(
                                'Load Next Page (${state.currentPage + 1} / ${state.totalPages})',
                                style: AppTheme.text(
                                  size: 13,
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          false => const SizedBox.shrink(),
                        },
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    };
  }
}
