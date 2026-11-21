import '../entities/home_dashboard_data.dart';

/// Contract for loading the home dashboard domain data.
abstract interface class HomeRepository {
  HomeDashboardData getDashboardData();
}
