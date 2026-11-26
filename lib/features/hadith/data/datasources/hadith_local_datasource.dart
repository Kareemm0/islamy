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
      translation:
          '"The strong believer is better and more beloved to Allah '
          'than the weak believer, while there is good in both..."',
      narrator: 'Abu Hurairah',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Muslim',
      reference: 'Book of Destiny • Hadith 2664',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى»',
      translation: '"Actions are only by intentions, and every person will have only what they intended."',
      narrator: 'Umar ibn al-Khattab',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Al-Bukhari',
      reference: 'Book of Revelation • Hadith 1',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ»',
      translation: '"None of you truly believes until he loves for his brother what he loves for himself."',
      narrator: 'Anas ibn Malik',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Al-Bukhari',
      reference: 'Book of Faith • Hadith 13',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ»',
      translation: '"Whoever believes in Allah and the Last Day, let him speak good or remain silent."',
      narrator: 'Abu Hurairah',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Al-Bukhari',
      reference: 'Book of Manners • Hadith 6018',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ»',
      translation: '"A Muslim is the one from whose tongue and hand the Muslims are safe."',
      narrator: 'Abdullah ibn Amr',
      narratorArabic: '(رضي الله عنهما)',
      source: 'Sahih Al-Bukhari',
      reference: 'Book of Faith • Hadith 10',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«الطُّهُورُ شَطْرُ الْإِيمَانِ، وَالْحَمْدُ لِلَّهِ تَمْلَأُ الْمِيزَانَ»',
      translation: '"Purification is half of faith, and Alhamdulillah fills the scale."',
      narrator: 'Abu Malik al-Ash\'ari',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Muslim',
      reference: 'Book of Purification • Hadith 223',
      grade: 'Sahih (صحيح)',
    ),
    HadithOfDay(
      arabic: '«تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ»',
      translation: '"Your smile in the face of your brother is charity."',
      narrator: 'Abu Dharr',
      narratorArabic: '(رضي الله عنه)',
      source: 'Jami\' At-Tirmidhi',
      reference: 'Book of Righteousness • Hadith 1956',
      grade: 'Hasan (حسن)',
    ),
    HadithOfDay(
      arabic: '«كَلِمَتَانِ خَفِيفَتَانِ عَلَى اللِّسَانِ، ثَقِيلَتَانِ فِي الْمِيزَانِ: سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ»',
      translation: '"Two words are light on the tongue, heavy on the scale: SubhanAllahi wa bihamdihi, SubhanAllahil-Azim."',
      narrator: 'Abu Hurairah',
      narratorArabic: '(رضي الله عنه)',
      source: 'Sahih Al-Bukhari',
      reference: 'Book of Supplications • Hadith 6406',
      grade: 'Sahih (صحيح)',
    ),
  ];
}
