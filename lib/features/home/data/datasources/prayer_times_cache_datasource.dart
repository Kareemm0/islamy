import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../../domain/entities/home_prayer.dart';
import 'prayer_times_remote_datasource.dart';

/// Persists prayer times in the local Hive database for offline-first loading.
class PrayerTimesCacheDatasource {
  const PrayerTimesCacheDatasource(this._box);

  final Box<String> _box;

  static const _key = 'cached_prayer_times';

  PrayerTimesResult? getCached() {
    final raw = _box.get(_key);
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final prayersJson = map['prayers'] as List<dynamic>;
      return PrayerTimesResult(
        city: map['city'] as String,
        hijriDate: map['hijriDate'] as String,
        gregorianDate: map['gregorianDate'] as String,
        prayers: prayersJson.map((e) {
          final p = e as Map<String, dynamic>;
          return HomePrayer(
            name: p['name'] as String,
            arabicName: p['arabicName'] as String,
            time: p['time'] as String,
          );
        }).toList(),
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> save(PrayerTimesResult result) => _box.put(
    _key,
    jsonEncode({
      'city': result.city,
      'hijriDate': result.hijriDate,
      'gregorianDate': result.gregorianDate,
      'prayers': result.prayers
          .map(
            (p) => {
              'name': p.name,
              'arabicName': p.arabicName,
              'time': p.time,
            },
          )
          .toList(),
    }),
  );
}
