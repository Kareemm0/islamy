import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/azkar_item_model.dart';
import 'azkar_remote_datasource.dart';

class AzkarRemoteDataSourceImpl implements AzkarRemoteDataSource {
  const AzkarRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<Map<String, List<AzkarItemModel>>> getAzkarByCategory() async {
    final json = await _client.getJson(ApiEndpoints.azkarUrl);
    final result = <String, List<AzkarItemModel>>{};

    for (final entry in json.entries) {
      final value = entry.value;
      if (value is! List) continue;
      final parsedItems = <AzkarItemModel>[];
      _collectItems(value, parsedItems);
      result[entry.key] = List.unmodifiable(parsedItems);
    }

    return result;
  }

  static void _collectItems(
    List<dynamic> rawList,
    List<AzkarItemModel> target,
  ) {
    for (final element in rawList) {
      if (element is List) {
        _collectItems(element, target);
      } else if (element is Map<String, dynamic>) {
        final model = AzkarItemModel.fromJson(element);
        if (_isStopPlaceholder(model)) continue;
        target.add(model);
      }
    }
  }

  static bool _isStopPlaceholder(AzkarItemModel model) {
    final c = model.content.trim().toLowerCase();
    final cat = model.category.trim().toLowerCase();
    return c.isEmpty || c == 'stop' || cat == 'stop';
  }
}
