import '../../domain/entities/azkar_item.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_local_datasource.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  const AzkarRepositoryImpl({
    this._localDataSource = const AzkarLocalDataSource(),
  });

  final AzkarLocalDataSource _localDataSource;

  @override
  List<AzkarItem> getAzkarItems() => _localDataSource.getSampleItems();
}
