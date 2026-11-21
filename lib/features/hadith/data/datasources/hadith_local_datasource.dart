import 'package:islamy/features/hadith/domain/entities/hadith_book.dart';
import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

class HadithLocalDataSource {
  const HadithLocalDataSource();

  HadithOfDay getHadithOfDay() => _hadithOfDay;

  List<HadithBook> getBooks() => _books;

  static const HadithOfDay _hadithOfDay = HadithOfDay(
    arabic:
        '«الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللهِ مِنَ الْمُؤْمِنِ '
        'الضَّعِيفِ، وَفِي كُلٍّ خَيْرٌ»',
    translation:
        '"The strong believer is better and more beloved to Allah '
        'than the weak believer, while there is good in both..."',
    narrator: 'Abu Hurairah',
    narratorArabic: '(رضي الله عنه)',
    source: 'Sahih Muslim',
    reference: 'Book of Destiny • Hadith 2664',
    grade: 'Sahih (صحيح)',
  );

  static const List<HadithBook> _books = [
    HadithBook(
      number: 1,
      name: 'Sahih Al-Bukhari',
      arabicName: 'صحيح البخاري',
      author: 'Imam Muhammad al-Bukhari (رحمه الله)',
      description:
          'The most authentic book of Hadith in Islamic literature. '
          'Compiled over 16 years with rigorous authentication chains.',
      tag: '100% Authentic (صحيح)',
      sectionCount: '97 Chapters',
      hadithCount: '7,563',
      isHero: true,
    ),
    HadithBook(
      number: 2,
      name: 'Sahih Muslim',
      arabicName: 'صحيح مسلم',
      author: 'Imam Muslim ibn al-Hajjaj',
      description:
          'Celebrated for its strict thematic consistency, rigorous '
          'transmission criteria, and pristine ordering.',
      tag: 'Sahih (صحيح)',
      sectionCount: '56 Chapters',
      hadithCount: '7,500',
    ),
    HadithBook(
      number: 3,
      name: 'Sunan Abu Dawood',
      arabicName: 'سنن أبي داود',
      author: 'Imam Abu Dawood as-Sijistani',
      description:
          'Primary authority on legal traditions and Fiqh '
          'jurisprudence traditions underpinning Islamic law.',
      tag: 'Fiqh Rulings',
      sectionCount: '43 Books',
      hadithCount: '5,274',
    ),
    HadithBook(
      number: 4,
      name: "Jami' At-Tirmidhi",
      arabicName: 'جامع الترمذي',
      author: "Imam Abu 'Isa Muhammad at-Tirmidhi",
      description:
          'Known for unique comparative evaluations of jurisprudence '
          'opinions and detailed Hadith authenticity gradings.',
      tag: 'Detailed Grading',
      sectionCount: '49 Chapters',
      hadithCount: '3,956',
    ),
    HadithBook(
      number: 5,
      name: "Sunan An-Nasa'i",
      arabicName: 'سنن النسائي',
      author: "Imam Ahmad an-Nasa'i",
      description:
          'Highest standard of chain examination following the two '
          'Sahihs, focusing on daily practice and purification rulings.',
      tag: 'As-Sunan al-Sughra',
      sectionCount: '52 Chapters',
      hadithCount: '5,758',
    ),
    HadithBook(
      number: 6,
      name: 'Sunan Ibn Majah',
      arabicName: 'سنن ابن ماجه',
      author: 'Imam Ibn Majah al-Qazwini',
      description:
          'Comprehensive collection featuring invaluable narrations '
          'with excellent chapter arrangements across faith & life.',
      tag: 'Sunan',
      sectionCount: '37 Books',
      hadithCount: '4,341',
    ),
  ];
}
