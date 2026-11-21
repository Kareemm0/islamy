import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/hadith_book.dart';
import '../repositories/hadith_repository.dart';

class GetHadithBooksUseCase {
  const GetHadithBooksUseCase(this._repository);

  final HadithRepository _repository;

  Future<Either<Failure, List<HadithBook>>> call() => _repository.getBooks();
}
