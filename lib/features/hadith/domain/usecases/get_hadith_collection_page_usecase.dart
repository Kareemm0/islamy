import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/hadith_collection_page_entity.dart';
import '../repositories/hadith_repository.dart';

class GetHadithCollectionPageParams {
  const GetHadithCollectionPageParams({
    required this.slug,
    required this.page,
    this.limit = 20,
  });

  final String slug;
  final int page;
  final int limit;
}

class GetHadithCollectionPageUseCase {
  const GetHadithCollectionPageUseCase(this._repository);

  final HadithRepository _repository;

  Future<Either<Failure, HadithCollectionPage>> call(
    GetHadithCollectionPageParams params,
  ) => _repository.getCollectionPage(
    slug: params.slug,
    page: params.page,
    limit: params.limit,
  );
}
