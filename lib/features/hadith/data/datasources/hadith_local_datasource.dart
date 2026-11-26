import 'package:islamy/features/hadith/domain/entities/hadith_of_day.dart';

class HadithLocalDataSource {
  const HadithLocalDataSource();

  /// Hadith rotates every 30 minutes (same slot => same hadith, even after restart).
  static const rotation = Duration(minutes: 30);

  HadithOfDay getHadithOfDay() {
    final slot =
        DateTime.now().millisecondsSinceEpoch ~/ rotation.inMilliseconds;
    return _hadiths[slot % _hadiths.length];
  }

  static const List<HadithOfDay> _hadiths = [
    HadithOfDay(
      arabic:
          '«الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللهِ مِنَ الْمُؤْمِنِ '
          'الضَّعِيفِ، وَفِي كُلٍّ خَيْرٌ»',
      translation: '',
      narrator: 'أبو هريرة',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح مسلم',
      reference: 'كتاب القدر • حديث 2664',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى»',
      translation: '',
      narrator: 'عمر بن الخطاب',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح البخاري',
      reference: 'كتاب بدء الوحي • حديث 1',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ»',
      translation: '',
      narrator: 'أنس بن مالك',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح البخاري',
      reference: 'كتاب الإيمان • حديث 13',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ»',
      translation: '',
      narrator: 'أبو هريرة',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح البخاري',
      reference: 'كتاب الأدب • حديث 6018',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ»',
      translation: '',
      narrator: 'عبد الله بن عمرو',
      narratorArabic: '(رضي الله عنهما)',
      source: 'صحيح البخاري',
      reference: 'كتاب الإيمان • حديث 10',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«الطُّهُورُ شَطْرُ الْإِيمَانِ، وَالْحَمْدُ لِلَّهِ تَمْلَأُ الْمِيزَانَ»',
      translation: '',
      narrator: 'أبو مالك الأشعري',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح مسلم',
      reference: 'كتاب الطهارة • حديث 223',
      grade: 'صحيح',
    ),
    HadithOfDay(
      arabic: '«تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ»',
      translation: '',
      narrator: 'أبو ذر الغفاري',
      narratorArabic: '(رضي الله عنه)',
      source: 'جامع الترمذي',
      reference: 'كتاب البر والصلة • حديث 1956',
      grade: 'حسن',
    ),
    HadithOfDay(
      arabic: '«كَلِمَتَانِ خَفِيفَتَانِ عَلَى اللِّسَانِ، ثَقِيلَتَانِ فِي الْمِيزَانِ: سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ»',
      translation: '',
      narrator: 'أبو هريرة',
      narratorArabic: '(رضي الله عنه)',
      source: 'صحيح البخاري',
      reference: 'كتاب الدعوات • حديث 6406',
      grade: 'صحيح',
    ),
  ];
}
