import '../../domain/entities/azkar_badge.dart';
import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';

class AzkarLocalDataSource {
  const AzkarLocalDataSource();

  List<AzkarItem> getSampleItems() {
    const m = AzkarCategory.morning;
    final morning = <AzkarItem>[
      AzkarItem(
        id: 'm1',
        category: m,
        source: 'Sahih Muslim',
        badge: AzkarBadge.protection,
        count: 1,
        arabic:
            'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا\nاللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ\nعَلَى كُلِّ شَيْءٍ قَدِيرٌ',
        translation:
            '“We have reached the morning and at this very time unto Allah belongs all sovereignty, and all praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, unto Him belongs all sovereignty and praise and He is over all things omnipotent.”',
      ),
      AzkarItem(
        id: 'm2',
        category: m,
        source: 'Sahih Muslim (3 times)',
        badge: AzkarBadge.greatReward,
        repetitions: 3,
        count: 1,
        arabic:
            'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ: عَدَدَ خَلْقِهِ، وَرِضَا نَفْسِهِ،\nوَزِنَةَ عَرْشِهِ، وَمِدَادَ كَلِمَاتِهِ',
        translation:
            '“Glory is to Allah and praise is to Him, by the multitude of His creation, by His Pleasure, by the weight of His Throne, and by the extent of His Words.”',
      ),
      AzkarItem(
        id: 'm3',
        category: m,
        source: 'Surah Al-Baqarah (255)',
        title: 'Ayat Al-Kursi (آية الكرسي)',
        arabicSize: 18,
        count: 1,
        recitedAt: '06:14 AM',
        arabic:
            'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ\nلَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ...',
        translation:
            '“Allah! There is no deity except Him, the Ever-Living, the Sustainer of all existence. Neither drowsiness…',
      ),
    ];
    const extras = <(String, String, String, int)>[
      (
        'Surah Al-Ikhlas (3 times)',
        'قُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ',
        '“Say: He is Allah, One. Allah, the Eternal Refuge. He neither begets nor is born, nor is there to Him any equivalent.”',
        3,
      ),
      (
        'Abu Dawud (3 times)',
        'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
        '“O Allah, by You we have reached the morning, by You we reach the evening, by You we live and die, and to You is the resurrection.”',
        1,
      ),
      (
        'At-Tirmidhi (3 times)',
        'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
        '“In the name of Allah with whose name nothing can harm on earth or in heaven, and He is the All-Hearing, All-Knowing.”',
        3,
      ),
      (
        'Sahih al-Bukhari (100 times)',
        'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
        '“Glory is to Allah and praise is to Him.”',
        100,
      ),
      (
        'Sahih Muslim',
        'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
        '“I seek forgiveness from Allah and repent to Him.”',
        1,
      ),
      (
        'Abu Dawud',
        'اللَّهُمَّ عَافِنِي فِي بَدَنِي، اللَّهُمَّ عَافِنِي فِي سَمْعِي، اللَّهُمَّ عَافِنِي فِي بَصَرِي',
        '“O Allah, grant me health in my body, in my hearing, and in my sight.”',
        3,
      ),
      (
        'At-Tirmidhi',
        'رَضِيتُ بِاللَّهِ رَبًّا، وَبِالْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ نَبِيًّا',
        '“I am pleased with Allah as my Lord, Islam as my religion, and Muhammad as my Prophet.”',
        3,
      ),
      (
        'Sahih Muslim',
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
        '“O Allah, I ask You for pardon and well-being in this world and the next.”',
        1,
      ),
      (
        'Sahih Muslim',
        'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
        '“O Allah, send prayers and peace upon our Prophet Muhammad.”',
        10,
      ),
    ];
    for (var i = 0; i < extras.length; i++) {
      final e = extras[i];
      morning.add(
        AzkarItem(
          id: 'm${i + 4}',
          category: m,
          source: e.$1,
          arabic: e.$2,
          translation: e.$3,
          repetitions: e.$4,
          // Items 1, 3, 4 and 5 are done so the progress reads "4 of 12".
          count: i <= 1 ? e.$4 : 0,
        ),
      );
    }

    return [
      ...morning,
      AzkarItem(
        id: 'e1',
        category: AzkarCategory.evening,
        source: 'Sahih Muslim',
        badge: AzkarBadge.protection,
        arabic:
            'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ',
        translation:
            '“We have reached the evening and at this very time unto Allah belongs all sovereignty, and all praise is for Allah.”',
      ),
      AzkarItem(
        id: 'e2',
        category: AzkarCategory.evening,
        source: 'Abu Dawud (3 times)',
        repetitions: 3,
        badge: AzkarBadge.greatReward,
        arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
        translation:
            '“I seek refuge in the perfect words of Allah from the evil of what He has created.”',
      ),
      AzkarItem(
        id: 'p1',
        category: AzkarCategory.afterPrayer,
        source: 'Sahih Muslim (33 times)',
        repetitions: 33,
        badge: AzkarBadge.greatReward,
        arabic: 'سُبْحَانَ اللَّهِ',
        translation: '“Glory is to Allah.”',
      ),
      AzkarItem(
        id: 'p2',
        category: AzkarCategory.afterPrayer,
        source: 'Sahih Muslim (33 times)',
        repetitions: 33,
        arabic: 'الْحَمْدُ لِلَّهِ',
        translation: '“All praise is for Allah.”',
      ),
      AzkarItem(
        id: 's1',
        category: AzkarCategory.sleep,
        source: 'Sahih al-Bukhari',
        arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
        translation: '“In Your name, O Allah, I die and I live.”',
      ),
      AzkarItem(
        id: 's2',
        category: AzkarCategory.sleep,
        source: 'Sahih al-Bukhari',
        arabic:
            'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
        translation:
            '“All praise is for Allah who gave us life after having taken it from us, and unto Him is the resurrection.”',
      ),
    ];
  }
}
