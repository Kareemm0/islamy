import '../../domain/entities/quran_last_read_entity.dart';
import '../../domain/entities/quran_surah_entity.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_local_datasource.dart';

class QuranRepositoryImpl implements QuranRepository {
  const QuranRepositoryImpl(this._datasource);

  final QuranLocalDatasource _datasource;

  @override
  QuranLastRead getLastRead() => _datasource.getLastRead();

  @override
  List<QuranSurah> getSurahs() => _datasource.getSurahs();

  @override
  Set<int> getInitialBookmarks() => _datasource.getInitialBookmarks();
}
