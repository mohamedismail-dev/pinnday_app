import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyle {
  static TextTheme getTextTheme({
    required bool isArabic,
    required bool isDark,
  }) {
    if (isArabic) return _buildArabicTextTheme(isDark);
    return isDark ? darkTextTheme : lightTextTheme;
  }

  static TextTheme _buildArabicTextTheme(bool isDark) {
    final color = isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight;
    final primary = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final onBg = isDark
        ? AppColors.onBackgroundDark
        : AppColors.onBackgroundLight;
    final onPrimary = isDark
        ? AppColors.onPrimaryDark
        : AppColors.onPrimaryLight;

    return GoogleFonts.cairoTextTheme().copyWith(
      headlineLarge: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: GoogleFonts.cairo(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: isDark ? color : primary,
      ),
      headlineSmall: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDark ? color : primary,
      ),
      bodyLarge: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: onBg,
      ),
      bodyMedium: GoogleFonts.cairo(fontSize: 14, color: onBg),
      labelLarge: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: onPrimary,
      ),
      labelMedium: GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: onPrimary,
      ),
      labelSmall: GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: primary,
      ),
    );
  }

  /// Light Theme Text Styles

  static TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceLight,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryLight,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryLight,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.onBackgroundLight,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.onBackgroundLight,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.onPrimaryLight,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.onPrimaryLight,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryLight,
    ),
  );

  /// Dark Theme Text Styles
  static TextTheme darkTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceDark,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.onSurfaceDark,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurfaceDark,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.onBackgroundDark,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.onBackgroundDark,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.onPrimaryDark,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.onPrimaryDark,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryDark,
    ),
  );
}
