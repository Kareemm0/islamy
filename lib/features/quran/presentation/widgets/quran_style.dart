import 'package:flutter/material.dart';

abstract final class QuranAssets {
  static const _base = 'assets/images/quran/';

  static const headerSearch = '${_base}header_search.svg';
  static const headerBell = '${_base}header_bell.svg';
  static const headerProfile = '${_base}header_profile.svg';
  static const searchIcon = '${_base}search_icon.svg';
  static const micIcon = '${_base}mic_icon.svg';
  static const heroMotif = '${_base}hero_motif.svg';
  static const arrowForward = '${_base}arrow_forward.svg';
  static const surahMedal = '${_base}surah_medal.svg';
  static const surahMedalFeatured = '${_base}surah_medal_featured.svg';
  static const bookmarkFilled = '${_base}bookmark_filled.svg';
  static const bookmarkOutline = '${_base}bookmark_outline.svg';
  static const fridayIcon = '${_base}friday_icon.svg';
}

abstract final class QuranPalette {
  static const micBackground = Color(0xFFF5F3EE);
  static const mintText = Color(0xFF87D2B1);
  static const verseInfoText = Color(0xFF8ED6AA);
  static const madaniBadgeBackground = Color(0xFFA6F2CF);
  static const madaniBadgeText = Color(0xFF00513A);

  static const lastReadGradient = LinearGradient(
    begin: Alignment(-0.45, -0.9),
    end: Alignment(0.45, 0.9),
    colors: [Color(0xFF004328), Color(0xFF0D5C3A), Color(0xFF00422E)],
  );
}
