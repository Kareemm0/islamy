import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_hadith_collection_page_usecase.dart';
import 'hadith_details_state.dart';

class HadithDetailsCubit extends Cubit<HadithDetailsState> {
  HadithDetailsCubit(this._getCollectionPage)
      : super(const HadithDetailsState());

  final GetHadithCollectionPageUseCase _getCollectionPage;

  Future<void> loadInitial({
    required String slug,
    String? initialName,
    int limit = 20,
  }) async {
    emit(
      state.copyWith(
        status: HadithDetailsStatus.loading,
        slug: slug,
        bookName: initialName ?? slug,
        limit: limit,
        currentPage: 1,
        clearError: true,
      ),
    );
    await _fetchPage(page: 1, append: false);
  }

  Future<void> loadPage(int page) async {
    if (page < 1 || page > state.totalPages || page == state.currentPage) {
      return;
    }
    emit(
      state.copyWith(
        status: HadithDetailsStatus.loading,
        currentPage: page,
        clearError: true,
      ),
    );
    await _fetchPage(page: page, append: false);
  }

  Future<void> loadNextPage() async {
    if (state.isLoadingMore || !state.hasNextPage) return;
    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoadingMore: true, clearError: true));
    await _fetchPage(page: nextPage, append: true);
  }

  Future<void> changeLimit(int newLimit) async {
    if (newLimit == state.limit) return;
    emit(
      state.copyWith(
        status: HadithDetailsStatus.loading,
        limit: newLimit,
        currentPage: 1,
        clearError: true,
      ),
    );
    await _fetchPage(page: 1, append: false);
  }

  Future<void> retry() async {
    emit(
      state.copyWith(
        status: HadithDetailsStatus.loading,
        clearError: true,
      ),
    );
    await _fetchPage(page: state.currentPage, append: false);
  }

  Future<void> _fetchPage({required int page, required bool append}) async {
    final result = await _getCollectionPage(
      GetHadithCollectionPageParams(
        slug: state.slug,
        page: page,
        limit: state.limit,
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: append ? state.status : HadithDetailsStatus.failure,
          isLoadingMore: false,
          errorMessage: failure.message,
        ),
      ),
      (pageData) => emit(
        state.copyWith(
          status: HadithDetailsStatus.success,
          bookName: pageData.name.isEmpty ? state.bookName : pageData.name,
          total: pageData.total,
          items: append
              ? List.unmodifiable([...state.items, ...pageData.items])
              : pageData.items,
          currentPage: pageData.pagination.currentPage,
          totalPages: pageData.pagination.totalPages,
          pages: pageData.pagination.pages,
          isLoadingMore: false,
          clearError: true,
        ),
      ),
    );
  }
}
