import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/hadith_book_model.dart';
import '../models/hadith_collection_page_model.dart';
import 'hadith_remote_datasource.dart';

class HadithRemoteDataSourceImpl implements HadithRemoteDataSource {
  const HadithRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<List<HadithBookModel>> getBooks() async {
    final list = await _client.getJsonList(ApiEndpoints.hadithBooks);
    return list
        .map((e) => HadithBookModel.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<HadithCollectionPageModel> getCollectionPage({
    required String slug,
    required int page,
    int limit = 20,
  }) async {
    final json = await _client.getJson(
      ApiEndpoints.hadithBySlug(slug, page: page, limit: limit),
    );
    return HadithCollectionPageModel.fromJson(json);
  }
}
