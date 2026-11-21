import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

export 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
    );
  }

  /// Plus Jakarta Sans text style helper.
  static TextStyle text({
    double size = 13,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.onSurface,
    double? height,
    double? letterSpacing,
  }) => GoogleFonts.plusJakartaSans(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height == null ? null : height / size,
    letterSpacing: letterSpacing,
  );

  /// Arabic text style (Figma uses FreeSerif; Amiri is the closest web font).
  static TextStyle arabic({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.onSurface,
    double? height,
  }) => GoogleFonts.amiri(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height == null ? null : height / size,
  );
}
