enum AzkarCategory {
  morning(
    'أذكار الصبح',
    '(الصباح)',
    'أذكار الصباح',
    'Morning Adhkar • أذكار الصبح',
    'Begin your daylight with barakah, protection,\nand gratitude.',
  ),
  evening(
    'أذكار المساء',
    '(المساء)',
    'أذكار المساء',
    'Evening Adhkar • أذكار المساء',
    'Close your day with remembrance, peace,\nand gratitude.',
  ),
  sleep(
    'أذكار النوم',
    '(النوم)',
    'أذكار النوم',
    'Sleep Adhkar • أذكار النوم',
    'Rest in the protection of Allah and\npeaceful remembrance.',
  ),
  wakeUp(
    'أذكار الاستيقاظ',
    '(الاستيقاظ)',
    'أذكار الاستيقاظ',
    'Waking Up • أذكار الاستيقاظ',
    'Awaken with thankfulness and praise\nto the Creator.',
  ),
  prophetsDua(
    'دعاء الأنبياء',
    '(الأنبياء)',
    'أدعية الأنبياء',
    'Prophets’ Duas • دعاء الأنبياء',
    'Supplications of the Prophets from the\nNoble Quran.',
  );

  const AzkarCategory(
    this.label,
    this.arabicLabel,
    this.jsonKey,
    this.title,
    this.subtitle,
  );

  final String label;
  final String arabicLabel;
  final String jsonKey;
  final String title;
  final String subtitle;
}
