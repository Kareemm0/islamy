import 'package:flutter/material.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_book_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_empty_state.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_header.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_hero_book_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_search_bar.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_spotlight_card.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_trust_footer.dart';

/// Scrollable body for the Hadith collections tab.
class HadithPageBody extends StatelessWidget {
  const HadithPageBody({
    super.key,
    required this.totalBooks,
    required this.books,
    required this.hadithOfDay,
    required this.sahihOnly,
    required this.saved,
    required this.onQueryChanged,
    required this.onFilterTap,
    required this.onCopy,
    required this.onSave,
    required this.onShare,
  });

  final int totalBooks;
  final List<HadithBook> books;
  final HadithOfDay hadithOfDay;
  final bool sahihOnly;
  final bool saved;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onFilterTap;
  final VoidCallback onCopy;
  final VoidCallback onSave;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        const HadithHeader(),
        HadithSearchBar(
          hint: 'Search $totalBooks canonical books, narrators, topics...',
          onChanged: onQueryChanged,
          filterActive: sahihOnly,
          onFilterTap: onFilterTap,
        ),
        const SizedBox(height: 16),
        HadithSpotlightCard(
          hadith: hadithOfDay,
          saved: saved,
          onCopy: onCopy,
          onSave: onSave,
          onShare: onShare,
        ),
        const SizedBox(height: 8),
        if (books.isEmpty) const HadithEmptyState(),
        for (final book in books) ...[
          const SizedBox(height: 8),
          book.isHero
              ? HadithHeroBookCard(book: book, onTap: () {})
              : HadithBookCard(book: book, onTap: () {}),
        ],
        const SizedBox(height: 16),
        const HadithTrustFooter(),
      ],
    );
  }
}
