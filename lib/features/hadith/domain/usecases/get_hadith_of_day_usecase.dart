import '../entities/hadith_of_day.dart';
import '../repositories/hadith_repository.dart';

class GetHadithOfDayUseCase {
  const GetHadithOfDayUseCase(this._repository);

  final HadithRepository _repository;

  HadithOfDay call() => _repository.getHadithOfDay();
}
