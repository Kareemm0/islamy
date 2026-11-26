import 'package:hive_ce_flutter/hive_ce_flutter.dart';

/// Opens the Hive boxes used as the app's local database.
class LocalDatabase {
  const LocalDatabase._();

  static const quranBox = 'quran_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(quranBox);
  }
}
