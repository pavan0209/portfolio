import 'package:flutter/material.dart';

import 'package:portfolio/common/styles/index.dart';

class AppToast {
  static void showSnackBar(BuildContext context, String message, Color? backgroundColor) {
    var snackBar = SnackBar(
      content: Center(
        child: Text(
          'Message successfully sent',
          textAlign: TextAlign.center,
          style: AppStyles.whiteTextLarge(),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSpacing.largeSpacing),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
