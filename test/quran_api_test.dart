import 'package:flutter_test/flutter_test.dart';
import 'package:islamy/features/quran/data/models/quran_surah_details_model.dart';
import 'package:islamy/features/quran/data/models/quran_surah_model.dart';
import 'package:islamy/features/quran/domain/entities/quran_surah_entity.dart';

void main() {
  test('QuranSurahModel parses /v1/surah JSON and maps to entity', () {
    final model = QuranSurahModel.fromJson(const {
      'number': 18,
      'name': 'سُورَةُ الكَهۡفِ',
      'englishName': 'Al-Kahf',
      'englishNameTranslation': 'The Cave',
      'numberOfAyahs': 110,
      'revelationType': 'Meccan',
    });
    final entity = model.toEntity();

    expect(entity.number, 18);
    expect(entity.name, 'Al-Kahf');
    expect(entity.arabicName, 'سُورَةُ الكَهۡفِ');
    expect(entity.meaning, 'The Cave');
    expect(entity.ayahCount, 110);
    expect(entity.revelation, SurahRevelation.makki);
    expect(entity.isFridaySunnah, isTrue);
  });

  test('QuranSurahDetailsModel parses /v1/surah/:id JSON and maps to entity', () {
    final model = QuranSurahDetailsModel.fromJson(const {
      'number': 1,
      'name': 'سُورَةُ ٱلْفَاتِحَةِ',
      'englishName': 'Al-Faatiha',
      'englishNameTranslation': 'The Opening',
      'revelationType': 'Meccan',
      'numberOfAyahs': 7,
      'ayahs': [
        {
          'number': 1,
          'text': 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
          'numberInSurah': 1,
          'juz': 1,
          'page': 1,
          'sajda': false,
        },
        {
          'number': 2,
          'text': 'ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ',
          'numberInSurah': 2,
          'juz': 1,
          'page': 1,
          'sajda': {'id': 1, 'recommended': true},
        },
      ],
    });
    final entity = model.toEntity();

    expect(entity.surah.number, 1);
    expect(entity.ayahs, hasLength(2));
    expect(entity.ayahs.first.hasSajda, isFalse);
    expect(entity.ayahs.last.hasSajda, isTrue);
  });
}
