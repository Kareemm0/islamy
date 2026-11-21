import '../models/hadith_book_model.dart';
import '../models/hadith_collection_page_model.dart';

abstract interface class HadithRemoteDataSource {
  Future<List<HadithBookModel>> getBooks();

  Future<HadithCollectionPageModel> getCollectionPage({
    required String slug,
    required int page,
    int limit = 20,
  });
}
