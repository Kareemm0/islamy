import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quran_surah_details_entity.dart';
import '../entities/quran_surah_entity.dart';

abstract interface class QuranRepository {
  Future<Either<Failure, List<QuranSurah>>> getSurahs();

  Future<Either<Failure, QuranSurahDetails>> getSurahDetails(int id);
}
