import 'package:islamy/features/hadith/data/datasources/hadith_local_datasource.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';
import 'package:islamy/features/hadith/domain/repositories/hadith_repository.dart';

class HadithRepositoryImpl implements HadithRepository {
  const HadithRepositoryImpl({
    this._localDataSource = const HadithLocalDataSource(),
  });

  final HadithLocalDataSource _localDataSource;

  @override
  HadithOfDay getHadithOfDay() => _localDataSource.getHadithOfDay();

  @override
  List<HadithBook> getBooks() => _localDataSource.getBooks();
}
