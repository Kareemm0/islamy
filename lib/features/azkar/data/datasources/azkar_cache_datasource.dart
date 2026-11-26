import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../models/azkar_item_model.dart';

/// Persists Azkar in the local Hive database for offline use.
class AzkarCacheDatasource {
  const AzkarCacheDatasource(this._box);

  final Box<String> _box;

  static const _key = 'azkar_by_category';

  Map<String, List<AzkarItemModel>>? getAzkarByCategory() {
    final raw = _box.get(_key);
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return map.map(
        (k, v) => MapEntry(
          k,
          (v as List)
              .map((e) => AzkarItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveAzkarByCategory(Map<String, List<AzkarItemModel>> data) =>
      _box.put(
        _key,
        jsonEncode(
          data.map(
            (k, v) => MapEntry(
              k,
              v
                  .map((m) => {
                        'category': m.category,
                        'count': m.count,
                        'description': m.description,
                        'reference': m.reference,
                        'content': m.content,
                      })
                  .toList(),
            ),
          ),
        ),
      );
}
