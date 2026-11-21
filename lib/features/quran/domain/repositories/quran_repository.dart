import '../entities/quran_last_read_entity.dart';
import '../entities/quran_surah_entity.dart';

abstract interface class QuranRepository {
  QuranLastRead getLastRead();

  List<QuranSurah> getSurahs();

  Set<int> getInitialBookmarks();
}
