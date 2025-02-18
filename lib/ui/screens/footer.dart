import 'package:flutter/material.dart';

import 'package:portfolio/common/styles/index.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => FooterSectionState();
}

class FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkGrey.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.defaultSpacing),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.start,
            children: [
              Text(
                'Made with',
                style: AppStyles.whiteTextLargeSemiBold().copyWith(color: AppColors.darkYellow.withOpacity(0.6)),
              ),
              const SizedBox(width: AppSpacing.smallSpacing),
              Icon(
                Icons.favorite,
                color: AppColors.red.withOpacity(0.9),
                size: 40,
              ),
              const SizedBox(width: AppSpacing.smallSpacing),
              Text(
                'and built with Flutter',
                style: AppStyles.whiteTextLargeSemiBold().copyWith(color: AppColors.darkYellow.withOpacity(0.6)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.defaultSpacing),
          Text(
            '\u00A9 2025 Pavan Sonawane. All Rights Reserved.',
            style: AppStyles.whiteText(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.defaultSpacing),
        ],
      ),
    );
  }
}
