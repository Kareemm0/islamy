import '../repositories/quran_repository.dart';

class GetQuranBookmarksUseCase {
  const GetQuranBookmarksUseCase(this._repository);

  final QuranRepository _repository;

  Set<int> call() => _repository.getInitialBookmarks();
}
