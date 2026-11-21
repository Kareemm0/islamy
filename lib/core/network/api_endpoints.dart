/// Remote REST API endpoints used across the app.
abstract final class ApiEndpoints {
  static const quranBaseUrl = 'https://api.alquran.cloud/v1';
  static const surahs = '$quranBaseUrl/surah';

  static String surahById(int id) => '$quranBaseUrl/surah/$id';
}
