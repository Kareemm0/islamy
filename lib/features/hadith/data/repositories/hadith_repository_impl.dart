import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/hadith_book.dart';
import '../../domain/entities/hadith_collection_page_entity.dart';
import '../../domain/entities/hadith_of_day.dart';
import '../../domain/repositories/hadith_repository.dart';
import '../datasources/hadith_local_datasource.dart';
import '../datasources/hadith_remote_datasource.dart';

class HadithRepositoryImpl implements HadithRepository {
  const HadithRepositoryImpl(this._remote, this._local);

  final HadithRemoteDataSource _remote;
  final HadithLocalDataSource _local;

  @override
  HadithOfDay getHadithOfDay() => _local.getHadithOfDay();

  @override
  Future<Either<Failure, List<HadithBook>>> getBooks() async {
    try {
      final models = await _remote.getBooks();
      final sorted = [...models]..sort((a, b) {
        if (a.slug == 'bukhari') return -1;
        if (b.slug == 'bukhari') return 1;
        if (a.slug == 'muslim') return -1;
        if (b.slug == 'muslim') return 1;
        return a.name.compareTo(b.name);
      });
      final entities = <HadithBook>[
        for (var i = 0; i < sorted.length; i++) sorted[i].toEntity(i + 1),
      ];
      return Right(List.unmodifiable(entities));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, HadithCollectionPage>> getCollectionPage({
    required String slug,
    required int page,
    int limit = 20,
  }) async {
    try {
      final model = await _remote.getCollectionPage(
        slug: slug,
        page: page,
        limit: limit,
      );
      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
