import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../models/hadith_book_model.dart';
import '../models/hadith_collection_page_model.dart';

/// Persists Hadith books and collection pages in the local Hive database.
class HadithCacheDatasource {
  const HadithCacheDatasource(this._box);

  final Box<String> _box;

  static const _booksKey = 'books';
  static String _pageKey(String slug, int page, int limit) =>
      'page_${slug}_${page}_$limit';

  List<HadithBookModel>? getBooks() {
    final raw = _box.get(_booksKey);
    if (raw == null) return null;
    try {
      return (jsonDecode(raw) as List)
          .map((e) => HadithBookModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> saveBooks(List<HadithBookModel> books) =>
      _box.put(_booksKey, jsonEncode(books));

  HadithCollectionPageModel? getCollectionPage(
    String slug,
    int page,
    int limit,
  ) {
    final raw = _box.get(_pageKey(slug, page, limit));
    if (raw == null) return null;
    try {
      return HadithCollectionPageModel.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveCollectionPage(
    String slug,
    int page,
    int limit,
    HadithCollectionPageModel model,
  ) =>
      _box.put(_pageKey(slug, page, limit), jsonEncode(model));
}
