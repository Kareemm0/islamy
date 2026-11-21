import '../entities/quran_last_read_entity.dart';
import '../repositories/quran_repository.dart';

class GetQuranLastReadUseCase {
  const GetQuranLastReadUseCase(this._repository);

  final QuranRepository _repository;

  QuranLastRead call() => _repository.getLastRead();
}
