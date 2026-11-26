enum AzkarCategory {
  morning(
    'أذكار الصباح',
    '(الصباح)',
    'أذكار الصباح',
    'أذكار الصباح',
    'ابدأ يومك بالبركة والحفظ والشكر لله.',
  ),
  evening(
    'أذكار المساء',
    '(المساء)',
    'أذكار المساء',
    'أذكار المساء',
    'اختم يومك بذكر الله والطمأنينة والشكر.',
  ),
  sleep(
    'أذكار النوم',
    '(النوم)',
    'أذكار النوم',
    'أذكار النوم',
    'نم في حفظ الله ورعايته بذكره الحكيم.',
  ),
  wakeUp(
    'أذكار الاستيقاظ',
    '(الاستيقاظ)',
    'أذكار الاستيقاظ',
    'أذكار الاستيقاظ',
    'استيقظ بحمد الله وشكره على نعمة الحياة.',
  ),
  prophetsDua(
    'أدعية الأنبياء',
    '(الأنبياء)',
    'أدعية الأنبياء',
    'أدعية الأنبياء',
    'أدعية الأنبياء والمرسلين من القرآن الكريم.',
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
