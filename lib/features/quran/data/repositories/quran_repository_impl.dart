import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/quran_surah_details_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_cache_datasource.dart';
import '../datasources/quran_remote_datasource.dart';

class QuranRepositoryImpl implements QuranRepository {
  QuranRepositoryImpl(this._remote, this._cache);

  final QuranRemoteDataSource _remote;

  final QuranCacheDatasource _cache;

  @override
  Future<Either<Failure, List<QuranSurah>>> getSurahs() async {
    try {
      final cached = _cache.getSurahs();
      if (cached != null && cached.isNotEmpty) {
        _prefetchDetails(cached);
        return Right(List.unmodifiable(cached.map((m) => m.toEntity())));
      }
      final models = await _remote.getSurahs();
      await _cache.saveSurahs(models);
      _prefetchDetails(models);
      return Right(List.unmodifiable(models.map((m) => m.toEntity())));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuranSurahDetails>> getSurahDetails(int id) async {
    try {
      final cached = _cache.getSurahDetails(id);
      if (cached != null && cached.ayahs.isNotEmpty) {
        return Right(cached.toEntity());
      }
      final model = await _remote.getSurahDetails(id);
      await _cache.saveSurahDetails(model);
      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  bool _prefetching = false;

  /// Downloads every surah not yet stored locally, in the background,
  /// so all surah details become available offline.
  Future<void> _prefetchDetails(List<dynamic> surahs) async {
    if (_prefetching) return;
    _prefetching = true;
    try {
      for (final s in surahs) {
        final id = s.number as int;
        final cached = _cache.getSurahDetails(id);
        if (cached != null && cached.ayahs.isNotEmpty) continue;
        final model = await _remote.getSurahDetails(id);
        await _cache.saveSurahDetails(model);
      }
    } catch (_) {
      // Offline or server error: retry on next launch.
    } finally {
      _prefetching = false;
    }
  }
}
