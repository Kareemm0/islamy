import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/quran_ayah_entity.dart';
import '../cubit/surah_details_cubit.dart';
import '../cubit/surah_details_state.dart';
import 'quran_error_view.dart';
import 'surah_bismillah_banner.dart';
import 'surah_details_header.dart';
import 'surah_details_shimmer.dart';
import 'surah_mushaf_page_card.dart';

class SurahDetailsBody extends StatelessWidget {
  const SurahDetailsBody({
    super.key,
    required this.surahId,
    required this.state,
  });

  final int surahId;
  final SurahDetailsState state;

  List<List<QuranAyah>> _groupByPage(List<QuranAyah> ayahs) {
    final pages = <List<QuranAyah>>[];
    for (final ayah in ayahs) {
      if (pages.isEmpty || pages.last.first.page != ayah.page) {
        pages.add([ayah]);
      } else {
        pages.last.add(ayah);
      }
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahDetailsCubit>();
    return switch (state) {
      SurahDetailsInitial() || SurahDetailsLoading() => Scaffold(
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
              'Surah $surahId',
              style: AppTheme.text(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          body: const SurahDetailsShimmer(),
        ),
      SurahDetailsFailure(:final message) => Scaffold(
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
          ),
          body: Center(
            child: QuranErrorView(
              message: message,
              onRetry: () => cubit.loadSurah(surahId),
            ),
          ),
        ),
      SurahDetailsSuccess(:final details) => () {
          final pages = _groupByPage(details.ayahs);
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SurahDetailsHeader(surah: details.surah),
                  ),
                  if (details.surah.number != 1 && details.surah.number != 9)
                    const SliverToBoxAdapter(child: SurahBismillahBanner()),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                    sliver: SliverList.separated(
                      itemCount: pages.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final pageAyahs = pages[index];
                        return SurahMushafPageCard(
                          surahNumber: details.surah.number,
                          pageNumber: pageAyahs.first.page,
                          juzNumber: pageAyahs.first.juz,
                          ayahs: pageAyahs,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }(),
    };
  }
}
