import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/router/routes.dart';

import '../cubit/quran_cubit.dart';
import '../cubit/quran_state.dart';
import 'quran_empty_state.dart';
import 'quran_error_view.dart';
import 'quran_header.dart';
import 'quran_last_read_card.dart';
import 'quran_search_bar.dart';
import 'quran_surah_list_shimmer.dart';
import 'quran_surah_tile.dart';

class QuranBody extends StatelessWidget {
  const QuranBody({super.key, required this.state});

  final QuranState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    final surahs = state.surahs;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: QuranHeader()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              QuranSearchBar(onChanged: cubit.setQuery),
              const SizedBox(height: 16),
              QuranLastReadCard(
                lastRead: state.lastRead,
                onContinue: () => context.pushNamed(
                  Routes.surahDetailsName,
                  pathParameters: const {'id': '18'},
                ),
              ),
              const SizedBox(height: 16),
              ...switch (state.status) {
                QuranStatus.initial || QuranStatus.loading => const [
                    QuranSurahListShimmer(),
                  ],
                QuranStatus.failure => [
                    QuranErrorView(
                      message: state.errorMessage ?? 'Could not fetch surahs.',
                      onRetry: cubit.loadSurahs,
                    ),
                  ],
                QuranStatus.success => switch (surahs.isEmpty) {
                    true => const [QuranEmptyState()],
                    false => [
                        for (var i = 0; i < surahs.length; i++) ...[
                          if (i > 0) const SizedBox(height: 10),
                          QuranSurahTile(
                            surah: surahs[i],
                            bookmarked: state.isBookmarked(surahs[i].number),
                            onBookmark: () =>
                                cubit.toggleBookmark(surahs[i].number),
                            onTap: () => context.pushNamed(
                              Routes.surahDetailsName,
                              pathParameters: {'id': '${surahs[i].number}'},
                            ),
                          ),
                        ],
                      ],
                  },
              },
            ]),
          ),
        ),
      ],
    );
  }
}
