import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_cache_datasource.dart';
import '../datasources/azkar_remote_datasource.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  const AzkarRepositoryImpl(this._remoteDataSource, this._cache);

  final AzkarRemoteDataSource _remoteDataSource;
  final AzkarCacheDatasource _cache;

  @override
  Future<Either<Failure, List<AzkarItem>>> getAzkarItems() async {
    try {
      var byCategory = _cache.getAzkarByCategory();
      if (byCategory == null || byCategory.isEmpty) {
        byCategory = await _remoteDataSource.getAzkarByCategory();
        await _cache.saveAzkarByCategory(byCategory);
      }
      final items = <AzkarItem>[];
      for (final category in AzkarCategory.values) {
        final models = byCategory[category.jsonKey] ?? const [];
        for (var i = 0; i < models.length; i++) {
          items.add(
            models[i].toEntity(
              id: '${category.name}_$i',
              targetCategory: category,
            ),
          );
        }
      }
      return Right(List.unmodifiable(items));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
