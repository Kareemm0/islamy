import '../models/azkar_item_model.dart';

abstract interface class AzkarRemoteDataSource {
  Future<Map<String, List<AzkarItemModel>>> getAzkarByCategory();
}
