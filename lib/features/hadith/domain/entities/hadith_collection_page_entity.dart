import 'hadith_item_entity.dart';
import 'hadith_pagination_entity.dart';

/// A paginated response page of hadiths for a collection slug.
class HadithCollectionPage {
  const HadithCollectionPage({
    required this.name,
    required this.slug,
    required this.total,
    required this.pagination,
    required this.items,
  });

  final String name;
  final String slug;
  final int total;
  final HadithPagination pagination;
  final List<HadithItem> items;
}
