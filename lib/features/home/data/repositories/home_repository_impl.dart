import '../../domain/entities/home_dashboard_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

/// Local-backed implementation of [HomeRepository].
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    this._localDatasource = const HomeLocalDatasource(),
  });

  final HomeLocalDatasource _localDatasource;

  @override
  HomeDashboardData getDashboardData() => _localDatasource.getDashboardData();
}
