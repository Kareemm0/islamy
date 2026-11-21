import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quran_surah_details_entity.dart';
import '../repositories/quran_repository.dart';

class GetSurahDetailsUseCase {
  const GetSurahDetailsUseCase(this._repository);

  final QuranRepository _repository;

  Future<Either<Failure, QuranSurahDetails>> call(int id) =>
      _repository.getSurahDetails(id);
}
