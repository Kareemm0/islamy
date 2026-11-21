import 'package:flutter_test/flutter_test.dart';
import 'package:islamy/features/azkar/data/models/azkar_item_model.dart';
import 'package:islamy/features/azkar/domain/entities/azkar_badge.dart';
import 'package:islamy/features/azkar/domain/entities/azkar_category.dart';

void main() {
  test('AzkarItemModel parses JSON, cleans escaped artifacts, and maps to entity', () {
    final model = AzkarItemModel.fromJson(const {
      'category': 'أدعية الأنبياء',
      'count': '03',
      'description': 'آدم علية السلام.',
      'reference': '. [الأعراف - 23].',
      'content':
          "\\n', '\"رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ\". [الأعراف - 23].\\n', '\\n', '\\n', '",
    });

    final entity = model.toEntity(
      id: 'prophetsDua_0',
      targetCategory: AzkarCategory.prophetsDua,
    );

    expect(entity.id, 'prophetsDua_0');
    expect(entity.category, AzkarCategory.prophetsDua);
    expect(entity.repetitions, 3);
    expect(entity.source, '[الأعراف - 23]');
    expect(entity.translation, 'آدم علية السلام.');
    expect(entity.arabic.contains(r'\n'), isFalse);
    expect(entity.arabic.contains('رَبَّنَا ظَلَمْنَا'), isTrue);
  });

  test('AzkarItemModel infers protection badge from description', () {
    final model = AzkarItemModel.fromJson(const {
      'category': 'أذكار الصباح',
      'count': '7',
      'description': 'من قالها كفاه الله ما أهمه من أمر الدنيا والأخرة.',
      'reference': '',
      'content': 'حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.',
    });

    final entity = model.toEntity(
      id: 'morning_0',
      targetCategory: AzkarCategory.morning,
    );

    expect(entity.repetitions, 7);
    expect(entity.badge, AzkarBadge.protection);
  });
}
