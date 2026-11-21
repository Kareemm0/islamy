/// Remote REST API endpoints used across the app.
abstract final class ApiEndpoints {
  static const quranBaseUrl = 'https://api.alquran.cloud/v1';
  static const surahs = '$quranBaseUrl/surah';

  static String surahById(int id) => '$quranBaseUrl/surah/$id';

  static const hadithBaseUrl = 'https://hadis-api-id.vercel.app/hadith';
  static const hadithBooks = '$hadithBaseUrl/';

  static String hadithBySlug(
    String slug, {
    required int page,
    int limit = 20,
  }) => '$hadithBaseUrl/$slug?page=$page&limit=$limit';
}
