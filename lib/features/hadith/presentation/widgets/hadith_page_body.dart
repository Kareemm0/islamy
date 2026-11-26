import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/router/routes.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/presentation/cubit/hadith_state.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_book_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_book_list_shimmer.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_empty_state.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_error_view.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_header.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_hero_book_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_search_bar.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_spotlight_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_trust_footer.dart';

/// Scrollable body for the Hadith collections tab.
class HadithPageBody extends StatelessWidget {
  const HadithPageBody({
    super.key,
    required this.state,
    required this.onQueryChanged,
    required this.onFilterTap,
    required this.onCopy,
    required this.onSave,
    required this.onShare,
    required this.onRetry,
  });

  final HadithState state;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onFilterTap;
  final VoidCallback onCopy;
  final VoidCallback onSave;
  final VoidCallback onShare;
  final VoidCallback onRetry;

  void _openBook(BuildContext context, HadithBook book) {
    context.pushNamed(
      Routes.hadithDetailsName,
      pathParameters: {'slug': book.slug},
      queryParameters: {'name': book.arabicName},
    );
  }

  @override
  Widget build(BuildContext context) {
    final books = state.books;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        const HadithHeader(),
        HadithSearchBar(
          hint: 'ابحث في ${state.totalBooks} كتب معتمدة أو رواة أو موضوعات...',
          onChanged: onQueryChanged,
          filterActive: state.sahihOnly,
          onFilterTap: onFilterTap,
        ),
        const SizedBox(height: 16),
        HadithSpotlightCard(
          hadith: state.hadithOfDay,
          saved: state.saved,
          onCopy: onCopy,
          onSave: onSave,
          onShare: onShare,
        ),
        const SizedBox(height: 12),
        ...switch (state.status) {
          HadithStatus.initial || HadithStatus.loading => const [
              HadithBookListShimmer(),
            ],
          HadithStatus.failure => [
              HadithErrorView(
                message: state.errorMessage ?? 'تعذر جلب المجموعات الحديثية.',
                onRetry: onRetry,
              ),
            ],
          HadithStatus.success => switch (books.isEmpty) {
              true => const [HadithEmptyState()],
              false => [
                  for (final book in books) ...[
                    const SizedBox(height: 8),
                    switch (book.isHero) {
                      true => HadithHeroBookCard(
                          book: book,
                          onTap: () => _openBook(context, book),
                        ),
                      false => HadithBookCard(
                          book: book,
                          onTap: () => _openBook(context, book),
                        ),
                    },
                  ],
                ],
            },
        },
        const SizedBox(height: 16),
        const HadithTrustFooter(),
      ],
    );
  }
}
