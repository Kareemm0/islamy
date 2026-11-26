/// Route path and name constants for the entire app.
abstract final class Routes {
  // Home
  static const home = '/home';
  static const homeName = 'home';
  static const qibla = 'qibla';
  static const qiblaName = 'qibla';

  // Quran
  static const quran = '/quran';
  static const quranName = 'quran';
  static const surahDetails = ':id';
  static const surahDetailsName = 'surah-details';

  // Azkar
  static const azkar = '/azkar';
  static const azkarName = 'azkar';

  // Hadith
  static const hadith = '/hadith';
  static const hadithName = 'hadith';
  static const hadithDetails = ':slug';
  static const hadithDetailsName = 'hadith-details';

  // Settings
  static const settings = '/settings';
  static const settingsName = 'settings';
  static const salawatReminder = 'salawat-reminder';
  static const salawatReminderName = 'salawat-reminder';
}
