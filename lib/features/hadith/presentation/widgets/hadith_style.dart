import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Asset path helpers for the Hadith feature.
abstract final class HadithAssets {
  static const String _iconsDir = 'assets/images/hadith';

  static String svg(String name) => '$_iconsDir/$name.svg';
}

/// Feature-specific colors used across Hadith cards and spotlight UI.
abstract final class HadithPalette {
  static const Color darkGreen = Color(0xFF0D5C3A);
  static const Color heroLightText = Color(0xFF8AD2A7);
  static const Color heroDescription = Color(0xFF8ED6AA);
  static const Color heroBadgeText = Color(0xFF745C00);
  static const Color hintText = Color(0xB3707971);
  static const Color mutedMeta = Color(0xFF707971);
  static const Color arabicBoxBackground = Color(0xB3F5F3EE);
  static const Color footerBackground = Color(0xFFF5F3EE);
  static const Color sahihTagText = Color(0xFF005232);
  static const Color gradingTagText = Color(0xFF241A00);
}

/// Shared shadows and effects for Hadith widgets.
abstract final class HadithEffects {
  static const List<BoxShadow> cardShadow = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 1, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> spotlightShadow = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, offset: Offset(0, 4)),
  ];

  static final ui.ImageFilter spotlightBlur = ui.ImageFilter.blur(
    sigmaX: 20,
    sigmaY: 20,
  );
}
