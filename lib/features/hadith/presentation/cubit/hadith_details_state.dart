import 'package:flutter/foundation.dart';

import '../../domain/entities/hadith_item_entity.dart';

enum HadithDetailsStatus { initial, loading, success, failure }

@immutable
class HadithDetailsState {
  const HadithDetailsState({
    this.status = HadithDetailsStatus.initial,
    this.slug = '',
    this.bookName = '',
    this.total = 0,
    this.items = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.limit = 20,
    this.pages = const [1],
    this.isLoadingMore = false,
    this.errorMessage,
  });

  final HadithDetailsStatus status;
  final String slug;
  final String bookName;
  final int total;
  final List<HadithItem> items;
  final int currentPage;
  final int totalPages;
  final int limit;
  final List<int> pages;
  final bool isLoadingMore;
  final String? errorMessage;

  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;

  HadithDetailsState copyWith({
    HadithDetailsStatus? status,
    String? slug,
    String? bookName,
    int? total,
    List<HadithItem>? items,
    int? currentPage,
    int? totalPages,
    int? limit,
    List<int>? pages,
    bool? isLoadingMore,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HadithDetailsState(
      status: status ?? this.status,
      slug: slug ?? this.slug,
      bookName: bookName ?? this.bookName,
      total: total ?? this.total,
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      limit: limit ?? this.limit,
      pages: pages ?? this.pages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HadithDetailsState &&
        other.status == status &&
        other.slug == slug &&
        other.bookName == bookName &&
        other.total == total &&
        listEquals(other.items, items) &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.limit == limit &&
        listEquals(other.pages, pages) &&
        other.isLoadingMore == isLoadingMore &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        status,
        slug,
        bookName,
        total,
        Object.hashAll(items),
        currentPage,
        totalPages,
        limit,
        Object.hashAll(pages),
        isLoadingMore,
        errorMessage,
      );
}
