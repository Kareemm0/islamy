import '../models/quran_surah_details_model.dart';
import '../models/quran_surah_model.dart';

abstract interface class QuranRemoteDataSource {
  Future<List<QuranSurahModel>> getSurahs();

  Future<QuranSurahDetailsModel> getSurahDetails(int id);
}
