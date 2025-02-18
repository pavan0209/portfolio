import 'package:flutter/material.dart';

import 'package:portfolio/common/utils/index.dart';
import 'package:portfolio/ui/widgets/index.dart';
import 'package:portfolio/common/styles/index.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> _projects = [
    {
      "projectId": 1,
      'projectIcon': Icons.code,
      'projectName': 'Portfolio Website',
      'projectDescription':
          'Developed a responsive portfolio website using Flutter, showcasing projects and skills with an interactive UI. Ensured seamless performance across devices with adaptive layouts for both mobile and desktop views.',
      'projectSkills': 'Flutter, Dart, UI/UX, OOPs',
      'projectLink': '',
      'project_gallery': [
        AppImageAssets.portfolioHome,
        AppImageAssets.portfolioAbout,
        AppImageAssets.portfolioProjects,
        AppImageAssets.portfolioContact,
        AppImageAssets.portfolioMobile,
        AppImageAssets.portfolioMobileContact,
      ],
    },
    {
      "projectId": 2,
      'projectIcon': Icons.flare_sharp,
      'projectName': 'Farmers Mart',
      'projectDescription':
          'This project is a mobile application built with Flutter, providing a smooth, cross-platform experience for both Android and iOS. It features a modern UI and fast performance for various functionalities.',
      'projectSkills': 'Flutter, Dart, UI/UX, OOPs',
      'projectLink': '',
      'project_gallery': [
        AppImageAssets.farmersLogin,
        AppImageAssets.farmersHome,
        AppImageAssets.farmersFruitDetails,
        AppImageAssets.farmersAccount,
      ],
    },
    {
      "projectId": 3,
      'projectIcon': Icons.money_outlined,
      'projectName': 'Expense Manager',
      'projectDescription':
          'Developed a cross-platform Expense Manager app using Flutter for tracking and simulating expenses, featuring real-time data visualization and customizable budgeting.',
      'projectSkills': 'Flutter, Dart, UI/UX, Exception Handling',
      'projectLink': '',
      'project_gallery': [
        AppImageAssets.expenseHome,
        AppImageAssets.expenseAddTrasactions,
        AppImageAssets.expenseGraphCategory,
      ],
    },
    {
      "projectId": 4,
      'projectIcon': Icons.pedal_bike_outlined,
      'projectName': "Biker's Hub",
      'projectDescription':
          'Developed a JavaFX application for bike management, allowing users to efficiently manage and view bike-related data in a centralized platform. Integrated user-friendly interfaces and features for easy access and control over bike inventory and details.',
      'projectSkills': 'Java, JavaFX, MySQL, OOPs, Git',
      'projectLink': '',
      'project_gallery': [
        AppImageAssets.bikersHome,
        AppImageAssets.bikersAddBike,
        AppImageAssets.bikersViewBike,
        AppImageAssets.bikersDeleteBike,
        AppImageAssets.bikersAbout,
      ],
    },
    {
      "projectId": 5,
      'projectIcon': Icons.data_object_outlined,
      'projectName': "NewsFlash(Inshort's Clone)",
      'projectDescription':
          'delivers fast, up-to-date local news with instant updates. Local admins can easily add news, while super admins ensure accuracy by quickly verifying content. Guests can effortlessly access all news without the need for logging in or signing up, making it convenient for everyone to stay informed.',
      'projectSkills': 'Java, OOPs, Exception Handling, UI/UX',
      'projectLink': '',
      'project_gallery': [
        AppImageAssets.newsLogin,
        AppImageAssets.newsHome,
        AppImageAssets.newsGuest,
      ],
    }
  ];

  int? hoveredCardIndex;

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
          'Projects ',
          style: AppStyles.whiteHeadLineLargeSemiBold(),
        ),
        const SizedBox(height: AppSpacing.largeSpacing),
        Wrap(
          spacing: 50,
          runSpacing: 50,
          children: [
            for (int index = 0; index < _projects.length; index++) _buildGridItem(isSmallScreen, _projects[index])
          ],
        )
      ],
    );
  }

  Widget _buildGridItem(bool isSmallScreen, Map<String, dynamic> project) {
    bool isHovered = hoveredCardIndex == project['projectId'];

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ImageGallery(
              imgList: project['project_gallery'],
              projectName: project['projectName'],
            );
          },
        );
      },
      onLongPress: () {
        setState(() {
          hoveredCardIndex = project['projectId'];
        });
      },
      onLongPressCancel: () {
        setState(() {
          hoveredCardIndex = null;
        });
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            hoveredCardIndex = project['projectId'];
          });
        },
        onExit: (event) {
          setState(() {
            hoveredCardIndex = null;
          });
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350, minHeight: 350, minWidth: 350),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.darkYellow.withOpacity(.3)),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkYellow,
                spreadRadius: isHovered ? 4 : 0,
                blurRadius: isHovered ? 8 : 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.standardPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.standardSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        project['projectIcon'],
                        size: 50,
                        color: AppColors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkGrey,
                        ),
                        padding: const EdgeInsets.all(AppPadding.smallPadding),
                        child: Icon(
                          Icons.open_in_new,
                          size: 26,
                          color: AppColors.darkYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.standardSpacing * 2),
                  Text(
                    project['projectName'],
                    style: AppStyles.whiteTextLargeSemiBold(),
                  ),
                  const SizedBox(height: AppSpacing.defaultSpacing),
                  Text(
                    project['projectDescription'],
                    style: AppStyles.lightGreyText(),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.defaultSpacing),
                  Wrap(
                    children: [
                      Text(
                        'Key Skills : ',
                        style: AppStyles.yellowText(),
                      ),
                      const SizedBox(width: AppSpacing.standardSpacing),
                      Text(
                        project['projectSkills'],
                        style: AppStyles.whiteText(),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.defaultSpacing),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
