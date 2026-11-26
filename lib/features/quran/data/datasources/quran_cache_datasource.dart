import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../models/quran_ayah_model.dart';
import '../models/quran_surah_details_model.dart';
import '../models/quran_surah_model.dart';

/// Persists Quran data in the local Hive database for offline use.
class QuranCacheDatasource {
  const QuranCacheDatasource(this._box);

  final Box<String> _box;

  static const _surahsKey = 'surahs';
  static String _detailsKey(int id) => 'surah_$id';

  List<QuranSurahModel>? getSurahs() {
    final raw = _box.get(_surahsKey);
    if (raw == null) return null;
    try {
      return (jsonDecode(raw) as List)
          .map((e) => QuranSurahModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> saveSurahs(List<QuranSurahModel> surahs) => _box.put(
        _surahsKey,
        jsonEncode(surahs.map(_surahToMap).toList()),
      );

  QuranSurahDetailsModel? getSurahDetails(int id) {
    final raw = _box.get(_detailsKey(id));
    if (raw == null) return null;
    try {
      return QuranSurahDetailsModel.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveSurahDetails(QuranSurahDetailsModel d) => _box.put(
        _detailsKey(d.number),
        jsonEncode({
          ..._surahToMap(d),
          'ayahs': d.ayahs.map(_ayahToMap).toList(),
        }),
      );

  static Map<String, dynamic> _surahToMap(dynamic s) => {
        'number': s.number,
        'name': s.name,
        'englishName': s.englishName,
        'englishNameTranslation': s.englishNameTranslation,
        'numberOfAyahs': s.numberOfAyahs,
        'revelationType': s.revelationType,
      };

  static Map<String, dynamic> _ayahToMap(QuranAyahModel a) => {
        'number': a.number,
        'numberInSurah': a.numberInSurah,
        'text': a.text,
        'juz': a.juz,
        'page': a.page,
        'sajda': a.hasSajda,
      };
}
