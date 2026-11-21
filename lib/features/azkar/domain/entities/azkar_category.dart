enum AzkarCategory {
  morning(
    'Morning',
    '(الصباح)',
    'Morning Adhkar • أذكار الصباح',
    'Begin your daylight with barakah, protection,\nand gratitude.',
  ),
  evening(
    'Evening',
    '(المساء)',
    'Evening Adhkar • أذكار المساء',
    'Close your day with remembrance, peace,\nand gratitude.',
  ),
  afterPrayer(
    'After Prayer',
    '(بعد الصلاة)',
    'After Prayer • أذكار بعد الصلاة',
    'Seal your prayer with glorification\nand praise.',
  ),
  sleep(
    'Sleep & Wake',
    '(النوم)',
    'Sleep & Wake • أذكار النوم',
    'Rest in the protection of Allah and\nawaken with thankfulness.',
  );

  const AzkarCategory(this.label, this.arabicLabel, this.title, this.subtitle);

  final String label;
  final String arabicLabel;
  final String title;
  final String subtitle;
}
