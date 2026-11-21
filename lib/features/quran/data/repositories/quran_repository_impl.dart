import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/quran_last_read_entity.dart';
import '../../domain/entities/quran_surah_details_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_local_datasource.dart';
import '../datasources/quran_remote_datasource.dart';

class QuranRepositoryImpl implements QuranRepository {
  const QuranRepositoryImpl(this._remote, this._local);

  final QuranRemoteDataSource _remote;
  final QuranLocalDatasource _local;

  @override
  QuranLastRead getLastRead() => _local.getLastRead();

  @override
  Future<Either<Failure, List<QuranSurah>>> getSurahs() async {
    try {
      final models = await _remote.getSurahs();
      return Right(List.unmodifiable(models.map((m) => m.toEntity())));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuranSurahDetails>> getSurahDetails(int id) async {
    try {
      final model = await _remote.getSurahDetails(id);
      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Set<int> getInitialBookmarks() => _local.getInitialBookmarks();
}
