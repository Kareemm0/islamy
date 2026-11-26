import 'package:flutter/foundation.dart';

import '../../domain/entities/quran_last_read_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';

enum QuranStatus { initial, loading, success, failure }

@immutable
class QuranState {
  const QuranState({
    required this.allSurahs,

    this.status = QuranStatus.initial,
    this.query = '',
    this.errorMessage,
  });

  final List<QuranSurah> allSurahs;

  final QuranStatus status;
  final String query;
  final String? errorMessage;

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

  QuranState copyWith({
    List<QuranSurah>? allSurahs,
    QuranLastRead? lastRead,
    Set<int>? bookmarked,
    QuranStatus? status,
    String? query,
    String? errorMessage,
    bool clearError = false,
  }) {
    return QuranState(
      allSurahs: allSurahs ?? this.allSurahs,

      status: status ?? this.status,
      query: query ?? this.query,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuranState &&
        listEquals(other.allSurahs, allSurahs) &&
        other.status == status &&
        other.query == query &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      Object.hash(Object.hashAll(allSurahs), status, query, errorMessage);
}
