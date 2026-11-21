import '../../../../core/errors/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/quran_surah_details_model.dart';
import '../models/quran_surah_model.dart';
import 'quran_remote_datasource.dart';

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  const QuranRemoteDataSourceImpl(this._client);

  final ApiClient _client;

  @override
  Future<List<QuranSurahModel>> getSurahs() async {
    final json = await _client.getJson(ApiEndpoints.surahs);
    final data = json['data'];
    if (data is! List) {
      throw const ServerException('Missing surah list in API response');
    }
    return data
        .map((e) => QuranSurahModel.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<QuranSurahDetailsModel> getSurahDetails(int id) async {
    final json = await _client.getJson(ApiEndpoints.surahById(id));
    final data = json['data'];
    if (data is! Map<String, dynamic>) {
      throw const ServerException('Missing surah details in API response');
    }
    return QuranSurahDetailsModel.fromJson(data);
  }
}
