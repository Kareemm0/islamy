/// Pagination metadata returned by `GET /hadith/:slug?page=&limit=`.
class HadithPagination {
  const HadithPagination({
    required this.totalItems,
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.pages,
  });

  final int totalItems;
  final int currentPage;
  final int pageSize;
  final int totalPages;
  final List<int> pages;

  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;
}
