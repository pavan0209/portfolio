import 'package:flutter/material.dart';
import 'package:portfolio/common/styles/index.dart';

class AppStyles {
  static whiteText() {
    return TextStyle(
      color: AppColors.white,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static whiteTextLarge() {
    return TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.titleSmall,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static whiteTextLargeSemiBold() {
    return TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.titleMedium,
      fontWeight: FontWeight.w600,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static whiteHeadLineLargeSemiBold() {
    return TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.headLineMedium,
      fontFamily: AppFontFamily.poppins,
      fontWeight: FontWeight.w600,
    );
  }

  static lightGreyText() {
    return TextStyle(
      color: AppColors.lightGrey,
      fontSize: AppFontSize.large,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static greyTitleSmall() {
    return TextStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.titleSmall,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static greyTitleLarge() {
    return TextStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.titleLarge,
      fontFamily: AppFontFamily.poppins,
    );
  }

  static yellowText() {
    return TextStyle(
      color: AppColors.darkYellow.withOpacity(0.8),
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.large,
    );
  }

  static yellowTextStyle() {
    return TextStyle(
      color: AppColors.darkYellow.withOpacity(0.8),
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.titleSmall,
    );
  }
}
