import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

class HadithLocalDataSource {
  const HadithLocalDataSource();

  HadithOfDay getHadithOfDay() => _hadithOfDay;

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
}
