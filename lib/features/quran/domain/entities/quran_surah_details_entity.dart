import 'quran_ayah_entity.dart';
import 'quran_surah_entity.dart';

class QuranSurahDetails {
  const QuranSurahDetails({
    required this.surah,
    required this.ayahs,
  });

  final QuranSurah surah;
  final List<QuranAyah> ayahs;
}
