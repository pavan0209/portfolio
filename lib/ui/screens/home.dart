import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/styles/index.dart';

import 'package:portfolio/common/utils/index.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> with SingleTickerProviderStateMixin {
  late double radius;
  late double iconSize;

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  final List<String> languageImages = [
    AppImageAssets.flutter,
    AppImageAssets.java,
    AppImageAssets.dart,
    AppImageAssets.cLanguage,
    AppImageAssets.python,
    AppImageAssets.css,
    AppImageAssets.figma,
    AppImageAssets.html,
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    radius = screenWidth < 800 ? 120 : 200;
    iconSize = screenWidth < 800 ? 50 : 60;
    return Wrap(
      spacing: 100,
      // runSpacing: 50,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: (radius + iconSize / 2) * 2,
          height: (radius + iconSize / 2) * 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: radius * 1.5,
                height: radius * 1.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppImageAssets.pavanImage),
              ),
              ...List.generate(
                languageImages.length,
                (index) => AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final angle = (2 * pi / languageImages.length) * index + _rotationAnimation.value;
                    final double x = radius * cos(angle);
                    final double y = radius * sin(angle);

                    return Transform.translate(
                      offset: Offset(x, y),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          languageImages[index],
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, I'm ",
              style: AppStyles.greyTitleLarge(),
            ),
            AnimatedTextKit(
              repeatForever: false,
              totalRepeatCount: 5,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Pavan Sonawane',
                  cursor: '.',
                  textStyle: AppStyles.whiteHeadLineLargeSemiBold(),
                  speed: const Duration(milliseconds: 300),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.standardSpacing),
            Wrap(
              children: [
                Text(
                  'Software Developer | ',
                  style: AppStyles.yellowTextStyle(),
                ),
                Text(
                  'Android/iOS Developer',
                  style: AppStyles.yellowTextStyle(),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.standardSpacing),
            Container(
              constraints: const BoxConstraints(maxWidth: 460, minWidth: 250),
              child: Text(
                'Passionate software developer with 8+ months of hands-on experience building dynamic mobile applications.',
                style: AppStyles.lightGreyText(),
              ),
            ),
            const SizedBox(height: AppSpacing.extraSpacing),
            if (!isSmallScreen) const SizedBox(height: AppSpacing.extraSpacing),
            Wrap(
              spacing: AppSpacing.extraSpacing,
              runSpacing: AppSpacing.defaultSpacing,
              children: [
                getIconImageContainer(AppImageAssets.linkedIn, URLProvider.linkedinUrl, 'LinkedIn'),
                getIconImageContainer(AppImageAssets.leetCode, URLProvider.leetcodeUrl, 'LeetCode'),
                getIconImageContainer(AppImageAssets.gfg, URLProvider.gfgUrl, 'Geeks For Geeks'),
                getIconImageContainer(AppImageAssets.github, URLProvider.githubUrl, 'GitHub'),
                getIconImageContainer(AppImageAssets.gitlab, URLProvider.gitlabUrl, 'GitLab'),
              ],
            ),
            // if (screenHeight < 300) const SizedBox(height: AppSpacing.defaultSpacing),
          ],
        ),
      ],
    );
  }

  Widget getIconImageContainer(String imageLink, String url, String message, {bool isSocialIcon = false}) {
    return GestureDetector(
      onTap: () => Services.launchURL(url),
      child: MouseRegion(
        onEnter: (event) => setState(() {}),
        onExit: (event) => setState(() {}),
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: message,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          textStyle: AppStyles.whiteText(),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(AppPadding.smallPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: !isSocialIcon ? AppColors.darkGrey.withOpacity(0.7) : null,
            ),
            child: Image.asset(imageLink),
          ),
        ),
      ),
    );
  }
}
