import 'package:flutter/foundation.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

@immutable
class HadithState {
  const HadithState({
    required this.hadithOfDay,
    required this.allBooks,
    this.query = '',
    this.sahihOnly = false,
    this.saved = false,
    this.copyCount = 0,
  });

  final HadithOfDay hadithOfDay;
  final List<HadithBook> allBooks;
  final String query;
  final bool sahihOnly;
  final bool saved;
  final int copyCount;

  int get totalBooks => allBooks.length;

  List<HadithBook> get books {
    final q = query.trim().toLowerCase();
    return allBooks.where((b) {
      if (sahihOnly && !b.tag.contains('Sahih') && !b.tag.contains('صحيح')) {
        return false;
      }
      if (q.isEmpty) return true;
      return b.name.toLowerCase().contains(q) ||
          b.author.toLowerCase().contains(q) ||
          b.description.toLowerCase().contains(q) ||
          b.arabicName.contains(q) ||
          b.tag.toLowerCase().contains(q);
    }).toList();
  }

  HadithState copyWith({
    HadithOfDay? hadithOfDay,
    List<HadithBook>? allBooks,
    String? query,
    bool? sahihOnly,
    bool? saved,
    int? copyCount,
  }) {
    return HadithState(
      hadithOfDay: hadithOfDay ?? this.hadithOfDay,
      allBooks: allBooks ?? this.allBooks,
      query: query ?? this.query,
      sahihOnly: sahihOnly ?? this.sahihOnly,
      saved: saved ?? this.saved,
      copyCount: copyCount ?? this.copyCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HadithState &&
        other.hadithOfDay == hadithOfDay &&
        listEquals(other.allBooks, allBooks) &&
        other.query == query &&
        other.sahihOnly == sahihOnly &&
        other.saved == saved &&
        other.copyCount == copyCount;
  }

  @override
  int get hashCode => Object.hash(
        hadithOfDay,
        Object.hashAll(allBooks),
        query,
        sahihOnly,
        saved,
        copyCount,
      );
}
