import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';

/// A saved Mushaf page.
class QuranBookmark {
  const QuranBookmark({
    required this.surahNumber,
    required this.surahName,
    required this.arabicName,
    required this.page,
    required this.juz,
    required this.firstAyah,
    required this.totalAyahs,
  });

  final int surahNumber;
  final String surahName;
  final String arabicName;
  final int page;
  final int juz;
  final int firstAyah;
  final int totalAyahs;

  double get progress =>
      totalAyahs == 0 ? 0 : (firstAyah / totalAyahs).clamp(0.0, 1.0);

  Map<String, dynamic> toMap() => {
        'surahNumber': surahNumber,
        'surahName': surahName,
        'arabicName': arabicName,
        'page': page,
        'juz': juz,
        'firstAyah': firstAyah,
        'totalAyahs': totalAyahs,
      };

  factory QuranBookmark.fromMap(Map<String, dynamic> m) => QuranBookmark(
        surahNumber: m['surahNumber'] as int,
        surahName: m['surahName'] as String,
        arabicName: m['arabicName'] as String,
        page: m['page'] as int,
        juz: m['juz'] as int,
        firstAyah: m['firstAyah'] as int,
        totalAyahs: m['totalAyahs'] as int,
      );

  bool isSame(int surah, int p) => surahNumber == surah && page == p;
}

/// Holds the saved bookmark (persisted offline in Hive).
class BookmarkCubit extends Cubit<QuranBookmark?> {
  BookmarkCubit(this._box) : super(_read(_box));

  final Box<String> _box;
  static const _key = 'bookmark';

  static QuranBookmark? _read(Box<String> box) {
    final raw = box.get(_key);
    if (raw == null) return null;
    try {
      return QuranBookmark.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> toggle(QuranBookmark b) async {
    final current = state;
    if (current != null && current.isSame(b.surahNumber, b.page)) {
      await _box.delete(_key);
      emit(null);
    } else {
      await _box.put(_key, jsonEncode(b.toMap()));
      emit(b);
    }
  }
}
