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
      author: meta?.author ?? 'Imam $name',
      description: meta?.description ??
          'Canonical collection of prophetic traditions transmitted by Imam $name.',
      tag: meta?.tag ?? 'Hadith Collection',
      sectionCount: meta?.sectionCount ?? 'Canonical Books',
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
    displayName: 'Sahih Al-Bukhari',
    arabicName: 'صحيح البخاري',
    author: 'Imam Muhammad al-Bukhari (رحمه الله)',
    description:
        'The most authentic book of Hadith in Islamic literature. Compiled over 16 years with rigorous authentication chains.',
    tag: '100% Authentic (صحيح)',
    sectionCount: '97 Chapters',
  ),
  'muslim': _BookMeta(
    displayName: 'Sahih Muslim',
    arabicName: 'صحيح مسلم',
    author: 'Imam Muslim ibn al-Hajjaj',
    description:
        'Celebrated for its strict thematic consistency, rigorous transmission criteria, and pristine ordering.',
    tag: 'Sahih (صحيح)',
    sectionCount: '56 Chapters',
  ),
  'abu-dawud': _BookMeta(
    displayName: 'Sunan Abu Dawud',
    arabicName: 'سنن أبي داود',
    author: 'Imam Abu Dawud as-Sijistani',
    description:
        'Primary authority on legal traditions and Fiqh jurisprudence traditions underpinning Islamic law.',
    tag: 'Fiqh Rulings',
    sectionCount: '43 Books',
  ),
  'tirmidzi': _BookMeta(
    displayName: "Jami' At-Tirmidhi",
    arabicName: 'جامع الترمذي',
    author: "Imam Abu 'Isa Muhammad at-Tirmidhi",
    description:
        'Known for unique comparative evaluations of jurisprudence opinions and detailed Hadith authenticity gradings.',
    tag: 'Detailed Grading',
    sectionCount: '49 Chapters',
  ),
  'nasai': _BookMeta(
    displayName: "Sunan An-Nasa'i",
    arabicName: 'سنن النسائي',
    author: "Imam Ahmad an-Nasa'i",
    description:
        'Highest standard of chain examination following the two Sahihs, focusing on daily practice and purification rulings.',
    tag: 'As-Sunan al-Sughra',
    sectionCount: '52 Chapters',
  ),
  'ibnu-majah': _BookMeta(
    displayName: 'Sunan Ibn Majah',
    arabicName: 'سنن ابن ماجه',
    author: 'Imam Ibn Majah al-Qazwini',
    description:
        'Comprehensive collection featuring invaluable narrations with excellent chapter arrangements across faith & life.',
    tag: 'Sunan',
    sectionCount: '37 Books',
  ),
  'malik': _BookMeta(
    displayName: 'Muwatta Imam Malik',
    arabicName: 'موطأ الإمام مالك',
    author: 'Imam Malik ibn Anas',
    description:
        'The earliest surviving written collection of Hadith and juristic practice from the people of Madinah.',
    tag: 'Sahih & Athar',
    sectionCount: '61 Books',
  ),
  'ahmad': _BookMeta(
    displayName: 'Musnad Imam Ahmad',
    arabicName: 'مسند الإمام أحمد',
    author: 'Imam Ahmad ibn Hanbal',
    description:
        'Monumental encyclopedia of prophetic traditions organized by Companion narrators.',
    tag: 'Musnad',
    sectionCount: '18 Musnads',
  ),
  'darimi': _BookMeta(
    displayName: 'Sunan Ad-Darimi',
    arabicName: 'سنن الدارمي',
    author: 'Imam Abdullah ibn Abdur-Rahman ad-Darimi',
    description:
        'Renowned collection prized for elevated chains of transmission and introductory chapters on knowledge and Sunnah.',
    tag: 'Sunan',
    sectionCount: '23 Books',
  ),
};
