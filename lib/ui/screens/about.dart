import 'package:flutter/material.dart';

import 'package:portfolio/common/styles/index.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: AppStyles.whiteHeadLineLargeSemiBold(),
        ),
        const SizedBox(height: AppSpacing.extraSpacing),
        Container(
          constraints: const BoxConstraints(maxWidth: 600, minWidth: 250),
          child: Text(
            'I am a software engineer with a passion for developing mobile applications using Flutter. I have experience in various programming languages such as Dart, Java, and Python. I am currently working on a cross-platform mobile application for the Client.',
            style: AppStyles.greyTitleSmall(),
            softWrap: true,
          ),
        ),
        const SizedBox(height: AppSpacing.defaultSpacing),
        Container(
          constraints: const BoxConstraints(maxWidth: 600, minWidth: 250),
          child: TabBar(
            dividerColor: AppColors.transparent,
            controller: _tabController,
            labelColor: AppColors.darkYellow,
            unselectedLabelColor: AppColors.white,
            indicatorColor: AppColors.darkYellow,
            labelStyle: AppStyles.whiteTextLarge(),
            tabAlignment: isSmallScreen ? TabAlignment.start : null,
            isScrollable: isSmallScreen,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            tabs: const [
              Tab(text: "Skills"),
              Tab(text: "Experience"),
              Tab(text: "Education"),
            ],
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 600, minWidth: 250, minHeight: 350, maxHeight: 350),
          child: TabBarView(
            controller: _tabController,
            children: [
              // Content for Skills tab
              getSkillsTabContent(),

              // Content for Experience tab
              getExperienceTabContent(),

              // Content for Education tab
              getEducationTabContent(),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSkillsTabContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.standardSpacing),
            Text('• Languages', style: AppStyles.yellowTextStyle()),
            const SizedBox(height: AppSpacing.standardSpacing / 2),
            Container(
              padding: const EdgeInsets.only(left: AppPadding.smallPadding),
              child: Text(
                '- Dart, Java, Python, C Programming, SQL, HTML/CSS ',
                style: AppStyles.whiteText(),
                softWrap: true,
              ),
            ),
            const SizedBox(height: AppSpacing.defaultSpacing),
            Text('• Frameworks and Tools', style: AppStyles.yellowTextStyle()),
            const SizedBox(height: AppSpacing.standardSpacing / 2),
            Container(
              padding: const EdgeInsets.only(left: AppPadding.smallPadding),
              child: Text(
                '- Flutter, SQFlite, Hive, GitLab, Excel ',
                style: AppStyles.whiteText(),
                softWrap: true,
              ),
            ),
            const SizedBox(height: AppSpacing.defaultSpacing),
            Text('• Platforms', style: AppStyles.yellowTextStyle()),
            const SizedBox(height: AppSpacing.standardSpacing / 2),
            Container(
              padding: const EdgeInsets.only(left: AppPadding.smallPadding),
              child: Text(
                '- VS Code, Android Studio, Figma, Linux, Windows ',
                style: AppStyles.whiteText(),
                softWrap: true,
              ),
            ),
            const SizedBox(height: AppSpacing.defaultSpacing),
            Text('• Soft Skills', style: AppStyles.yellowTextStyle()),
            const SizedBox(height: AppSpacing.standardSpacing / 2),
            Container(
              padding: const EdgeInsets.only(left: AppPadding.smallPadding),
              child: Text(
                '- Communication, TeamWork, Adaptability, Time Management',
                style: AppStyles.whiteText(),
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getExperienceTabContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.standardSpacing),
            Text('Pixel6 Web Studio Pvt Ltd', style: AppStyles.yellowTextStyle()),
            Text('Software Engineer Trainee', style: AppStyles.whiteText()),
            Text('Oct 2024 - Present', style: AppStyles.lightGreyText()),
            const SizedBox(height: AppSpacing.standardSpacing),
            Text(
              '• Working on building mobile apps using flutter for both Android and iOS.',
              style: AppStyles.whiteText(),
              softWrap: true,
            ),
            Text(
              '• Collaborating with the team to improve app performance and user experience.',
              style: AppStyles.whiteText(),
              softWrap: true,
            ),
            const SizedBox(height: AppSpacing.extraSpacing),
            Text('Biencaps Systems Pvt Ltd', style: AppStyles.yellowTextStyle()),
            Text('Flutter Developer Intern', style: AppStyles.whiteText()),
            Text('Dec 2023 - Mar 2024', style: AppStyles.lightGreyText()),
            const SizedBox(height: AppSpacing.standardSpacing),
            Text(
              '• Developed and maintained mobile applications using flutter and Dart.',
              style: AppStyles.whiteText(),
              softWrap: true,
            ),
            Text(
              '• Assisted in UI/UX design and mobile application development principles.',
              style: AppStyles.whiteText(),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget getEducationTabContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.standardSpacing),
            Text(
              'NBN Sinhgad School Of Engineering, Pune',
              style: AppStyles.yellowTextStyle(),
              softWrap: true,
            ),
            Text('B.E. Information Technology', style: AppStyles.whiteText()),
            Text('Oct 2021 - Jun 2024', style: AppStyles.lightGreyText()),
            Text('Percentage : 78.20%', style: AppStyles.whiteText()),
            const SizedBox(height: AppSpacing.defaultSpacing),
            Text(
              'Government Polytechnic, Nashik',
              style: AppStyles.yellowTextStyle(),
              softWrap: true,
            ),
            Text('Diploma Information Technology', style: AppStyles.whiteText()),
            Text('Aug 2018 - Jun 2021', style: AppStyles.lightGreyText()),
            Text('Percentage : 91.38%', style: AppStyles.whiteText()),
            const SizedBox(height: AppSpacing.defaultSpacing),
            Text(
              'LPDP Maratha English School, Satana',
              style: AppStyles.yellowTextStyle(),
              softWrap: true,
            ),
            Text('SSC', style: AppStyles.whiteText()),
            Text('Jun 2017 - Jun 2018', style: AppStyles.lightGreyText()),
            Text('Percentage : 92.40%', style: AppStyles.whiteText()),
          ],
        ),
      ),
    );
  }
}
