import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: AppTextStyle.lightTextTheme,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      outline: AppColors.strokeLight,
      surfaceContainer: AppColors.inputsLight,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.onPrimaryLight,
        textStyle: AppTextStyle.lightTextTheme.labelMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.secondaryLight,
        foregroundColor: AppColors.primaryLight,
        textStyle: AppTextStyle.lightTextTheme.titleMedium,
        side: BorderSide(color: AppColors.strokeLight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        side: BorderSide(color: AppColors.strokeLight),
        fixedSize: Size(32, 32),
        backgroundColor: AppColors.secondaryLight,
        foregroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputsLight,
      hintStyle: AppTextStyle.lightTextTheme.bodyMedium,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.strokeLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.strokeLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryLight, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0.0,
        overlayColor: Colors.transparent,
        foregroundColor: AppColors.primaryLight,
        textStyle: AppTextStyle.lightTextTheme.labelMedium,
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.strokeLight),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.onPrimaryLight,
    ),
  );

  /// ----- Dark Theme -----

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: AppTextStyle.darkTextTheme,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      outline: AppColors.strokeDark,
      surfaceContainer: AppColors.inputsDark,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.onPrimaryDark,
        textStyle: AppTextStyle.darkTextTheme.labelMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.inputsDark,
        foregroundColor: AppColors.onSurfaceDark,
        textStyle: AppTextStyle.lightTextTheme.titleMedium,
        side: BorderSide(color: AppColors.strokeDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        fixedSize: Size(32, 32),
        side: BorderSide(color: AppColors.strokeDark),
        backgroundColor: AppColors.inputsDark,
        foregroundColor: AppColors.onSurfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputsDark,
      hintStyle: AppTextStyle.darkTextTheme.bodyMedium,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.strokeDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.strokeDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0.0,
        overlayColor: Colors.transparent,
        foregroundColor: AppColors.primaryDark,
        textStyle: AppTextStyle.darkTextTheme.labelMedium,
      ),
    ),
    dividerTheme: DividerThemeData(color: AppColors.strokeDark),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimaryDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
    ),
  );
}
