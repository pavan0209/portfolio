import 'package:flutter/material.dart';
import 'package:portfolio/common/styles/index.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    textSelectionTheme: TextSelectionThemeData(selectionColor: AppColors.darkYellow.withOpacity(0.5)),
    fontFamily: AppFontFamily.poppins,
    scaffoldBackgroundColor: AppColors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      shadowColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.darkGrey, size: 24.0),
      titleTextStyle:
          TextStyle(color: AppColors.darkGrey, fontSize: AppFontSize.titleSmall, fontFamily: AppFontFamily.poppins),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: AppColors.transparent,
        elevation: 0,
        minimumSize: const Size(100, 40),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.darkYellow,
        textStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(100, 40),
        padding: const EdgeInsets.all(AppPadding.defaultPadding),
        foregroundColor: AppColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkYellow.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(200, 50),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.darkGrey),
      trackColor: WidgetStatePropertyAll(AppColors.darkGrey),
      radius: const Radius.circular(8),
      thickness: const WidgetStatePropertyAll(6),
    ),
  );
}
