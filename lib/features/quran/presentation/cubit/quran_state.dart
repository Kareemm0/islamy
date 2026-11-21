import 'package:flutter/foundation.dart';

import '../../domain/entities/quran_last_read_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';

@immutable
class QuranState {
  const QuranState({
    required this.allSurahs,
    required this.lastRead,
    required this.bookmarked,
    this.query = '',
  });

  final List<QuranSurah> allSurahs;
  final QuranLastRead lastRead;
  final Set<int> bookmarked;
  final String query;

  List<QuranSurah> get surahs {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return allSurahs;
    return allSurahs
        .where(
          (s) =>
              s.name.toLowerCase().contains(q) ||
              s.meaning.toLowerCase().contains(q) ||
              s.arabicName.contains(q) ||
              s.number.toString() == q,
        )
        .toList(growable: false);
  }

  bool isBookmarked(int number) => bookmarked.contains(number);

  QuranState copyWith({
    List<QuranSurah>? allSurahs,
    QuranLastRead? lastRead,
    Set<int>? bookmarked,
    String? query,
  }) {
    return QuranState(
      allSurahs: allSurahs ?? this.allSurahs,
      lastRead: lastRead ?? this.lastRead,
      bookmarked: bookmarked ?? this.bookmarked,
      query: query ?? this.query,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuranState &&
        listEquals(other.allSurahs, allSurahs) &&
        other.lastRead == lastRead &&
        setEquals(other.bookmarked, bookmarked) &&
        other.query == query;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAll(allSurahs),
        lastRead,
        Object.hashAllUnordered(bookmarked),
        query,
      );
}
