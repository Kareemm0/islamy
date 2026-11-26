import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/hadith_book.dart';

part 'hadith_book_model.freezed.dart';
part 'hadith_book_model.g.dart';

@freezed
abstract class HadithBookModel with _$HadithBookModel {
  const HadithBookModel._();

  const factory HadithBookModel({
    required String name,
    required String slug,
    @Default(0) int total,
  }) = _HadithBookModel;

  factory HadithBookModel.fromJson(Map<String, dynamic> json) =>
      _$HadithBookModelFromJson(json);

  HadithBook toEntity(int number) {
    final meta = _metadataBySlug[slug];
    return HadithBook(
      number: number,
      slug: slug,
      name: meta?.displayName ?? name,
      arabicName: meta?.arabicName ?? name,
      author: meta?.author ?? 'الإمام $name',
      description: meta?.description ??
          'مجموعة معتمدة من الأحاديث النبوية رواها الإمام $name.',
      tag: meta?.tag ?? 'مجموعة أحاديث',
      sectionCount: meta?.sectionCount ?? 'كتب معتمدة',
      hadithCount: _formatCount(total),
      total: total,
      isHero: slug == 'bukhari',
    );
  }

  static String _formatCount(int n) {
    final s = n.toString();
    if (s.length <= 3) return s;
    final prefix = s.substring(0, s.length - 3);
    final suffix = s.substring(s.length - 3);
    return '$prefix,$suffix';
  }
}

class _BookMeta {
  const _BookMeta({
    required this.displayName,
    required this.arabicName,
    required this.author,
    required this.description,
    required this.tag,
    required this.sectionCount,
  });

  final String displayName;
  final String arabicName;
  final String author;
  final String description;
  final String tag;
  final String sectionCount;
}

const Map<String, _BookMeta> _metadataBySlug = {
  'bukhari': _BookMeta(
    displayName: 'صحيح البخاري',
    arabicName: 'صحيح البخاري',
    author: 'الإمام محمد بن إسماعيل البخاري (رحمه الله)',
    description:
        'أصح كتاب في الحديث النبوي، ألّفه مؤلفه في ست عشرة سنة بأسانيد شديدة التحري.',
    tag: 'صحيح 100% (صحيح)',
    sectionCount: '97 كتابًا',
  ),
  'muslim': _BookMeta(
    displayName: 'صحيح مسلم',
    arabicName: 'صحيح مسلم',
    author: 'الإمام مسلم بن الحجاج',
    description:
        'اشتهر بحسن ترتيبه ودقة شروطه في الرواية وتناسق أبوابه الموضوعية.',
    tag: 'صحيح',
    sectionCount: '56 كتابًا',
  ),
  'abu-dawud': _BookMeta(
    displayName: 'سنن أبي داود',
    arabicName: 'سنن أبي داود',
    author: 'الإمام أبو داود السجستاني',
    description:
        'مرجع أساسي في أحاديث الأحكام والفقه التي تقوم عليها الشريعة.',
    tag: 'أحكام فقهية',
    sectionCount: '43 كتابًا',
  ),
  'tirmidzi': _BookMeta(
    displayName: 'جامع الترمذي',
    arabicName: 'جامع الترمذي',
    author: 'الإمام أبو عيسى محمد الترمذي',
    description:
        'عُرف بالموازنة بين آراء الفقهاء وببيان درجة الأحاديث تفصيلًا.',
    tag: 'تقييم مفصل',
    sectionCount: '49 بابًا',
  ),
  'nasai': _BookMeta(
    displayName: 'سنن النسائي',
    arabicName: 'سنن النسائي',
    author: 'الإمام أحمد بن شعيب النسائي',
    description:
        'من أشد الكتب تحريًا في الأسانيد بعد الصحيحين، ويعنى بأحكام العبادة والطهارة.',
    tag: 'السنن الصغرى',
    sectionCount: '52 كتابًا',
  ),
  'ibnu-majah': _BookMeta(
    displayName: 'سنن ابن ماجه',
    arabicName: 'سنن ابن ماجه',
    author: 'الإمام ابن ماجه القزويني',
    description:
        'مجموعة جامعة لروايات نفيسة وحسن ترتيب للأبواب في أمور الدين والحياة.',
    tag: 'السنن',
    sectionCount: '37 كتابًا',
  ),
  'malik': _BookMeta(
    displayName: 'موطأ الإمام مالك',
    arabicName: 'موطأ الإمام مالك',
    author: 'الإمام مالك بن أنس',
    description:
        'أقدم مصنف مكتوب وصل إلينا في الحديث والفقه من عمل أهل المدينة.',
    tag: 'صحيح وآثار',
    sectionCount: '61 كتابًا',
  ),
  'ahmad': _BookMeta(
    displayName: 'مسند الإمام أحمد',
    arabicName: 'مسند الإمام أحمد',
    author: 'الإمام أحمد بن حنبل',
    description:
        'موسوعة ضخمة في الأحاديث النبوية مرتبة على أسماء الصحابة الرواة.',
    tag: 'المسانيد',
    sectionCount: '18 مسندًا',
  ),
  'darimi': _BookMeta(
    displayName: 'سنن الدارمي',
    arabicName: 'سنن الدارمي',
    author: 'الإمام عبد الله بن عبد الرحمن الدارمي',
    description:
        'مجموعة مشهورة بعلو أسانيدها ومقدمتها في العلم والسنة.',
    tag: 'السنن',
    sectionCount: '23 كتابًا',
  ),
};
