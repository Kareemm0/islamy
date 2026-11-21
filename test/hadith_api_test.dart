import 'package:flutter_test/flutter_test.dart';
import 'package:islamy/features/hadith/data/models/hadith_book_model.dart';
import 'package:islamy/features/hadith/data/models/hadith_collection_page_model.dart';

void main() {
  test('HadithBookModel parses /hadith/ item JSON and maps to entity', () {
    final model = HadithBookModel.fromJson(const {
      'name': 'Abu Dawud',
      'slug': 'abu-dawud',
      'total': 4419,
    });
    final entity = model.toEntity(3);

    expect(entity.number, 3);
    expect(entity.slug, 'abu-dawud');
    expect(entity.name, 'Sunan Abu Dawud');
    expect(entity.arabicName, 'سنن أبي داود');
    expect(entity.total, 4419);
    expect(entity.hadithCount, '4,419');
    expect(entity.isHero, isFalse);
  });

  test('HadithCollectionPageModel parses paginated response and maps to entity', () {
    final model = HadithCollectionPageModel.fromJson(const {
      'name': 'Abu Dawud',
      'slug': 'abu-dawud',
      'total': 4419,
      'pagination': {
        'totalItems': 4419,
        'currentPage': 2,
        'pageSize': 300,
        'totalPages': 15,
        'pages': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      },
      'items': [
        {
          'number': 301,
          'arab': 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مَسْلَمَةَ...',
          'id': 'Telah menceritakan kepada kami...',
        },
      ],
    });
    final entity = model.toEntity();

    expect(entity.slug, 'abu-dawud');
    expect(entity.pagination.currentPage, 2);
    expect(entity.pagination.pageSize, 300);
    expect(entity.pagination.totalPages, 15);
    expect(entity.pagination.hasPreviousPage, isTrue);
    expect(entity.pagination.hasNextPage, isTrue);
    expect(entity.items, hasLength(1));
    expect(entity.items.first.number, 301);
  });
}
