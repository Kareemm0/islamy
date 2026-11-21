import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

abstract interface class HadithRepository {
  HadithOfDay getHadithOfDay();
  List<HadithBook> getBooks();
}
