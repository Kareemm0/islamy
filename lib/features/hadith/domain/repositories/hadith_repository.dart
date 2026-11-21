import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/hadith_book.dart';
import '../entities/hadith_collection_page_entity.dart';
import '../entities/hadith_of_day.dart';

abstract interface class HadithRepository {
  HadithOfDay getHadithOfDay();

  Future<Either<Failure, List<HadithBook>>> getBooks();

  Future<Either<Failure, HadithCollectionPage>> getCollectionPage({
    required String slug,
    required int page,
    int limit = 20,
  });
}
