import 'package:flutter/foundation.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

enum HadithStatus { initial, loading, success, failure }

@immutable
class HadithState {
  const HadithState({
    required this.hadithOfDay,
    required this.allBooks,
    this.status = HadithStatus.initial,
    this.query = '',
    this.sahihOnly = false,
    this.saved = false,
    this.copyCount = 0,
    this.errorMessage,
  });

  final HadithOfDay hadithOfDay;
  final List<HadithBook> allBooks;
  final HadithStatus status;
  final String query;
  final bool sahihOnly;
  final bool saved;
  final int copyCount;
  final String? errorMessage;

  int get totalBooks => allBooks.isEmpty ? 9 : allBooks.length;

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
    HadithStatus? status,
    String? query,
    bool? sahihOnly,
    bool? saved,
    int? copyCount,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HadithState(
      hadithOfDay: hadithOfDay ?? this.hadithOfDay,
      allBooks: allBooks ?? this.allBooks,
      status: status ?? this.status,
      query: query ?? this.query,
      sahihOnly: sahihOnly ?? this.sahihOnly,
      saved: saved ?? this.saved,
      copyCount: copyCount ?? this.copyCount,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HadithState &&
        other.hadithOfDay == hadithOfDay &&
        listEquals(other.allBooks, allBooks) &&
        other.status == status &&
        other.query == query &&
        other.sahihOnly == sahihOnly &&
        other.saved == saved &&
        other.copyCount == copyCount &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        hadithOfDay,
        Object.hashAll(allBooks),
        status,
        query,
        sahihOnly,
        saved,
        copyCount,
        errorMessage,
      );
}
