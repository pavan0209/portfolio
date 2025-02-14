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
}
