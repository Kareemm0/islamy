import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quran_surah_entity.dart';
import '../repositories/quran_repository.dart';

class GetSurahsUseCase {
  const GetSurahsUseCase(this._repository);

  final QuranRepository _repository;

  Future<Either<Failure, List<QuranSurah>>> call() => _repository.getSurahs();
}
