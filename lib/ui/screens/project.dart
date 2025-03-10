import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:portfolio/common/utils/index.dart';
import 'package:portfolio/provider/index.dart';
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
          '''1. Developed a responsive portfolio website using Flutter, showcasing projects and skills with an interactive UI. 
2. Ensured seamless performance across devices with adaptive layouts for both mobile and desktop views.''',
      'projectSkills': 'Flutter, Dart, UI/UX, GitHub, Provider State Management',
      'projectLink': 'https://github.com/pavan0209/portfolio',
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
          '''1. Developed an app that allows farmers to sell directly to customers, cutting out intermediaries.
2. This project is a mobile application built with Flutter, providing a smooth, cross-platform experience for both Android and iOS.''',
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
          '''1. The app helps users track and categorize their expenses, set budgets, and receive reminders. 
2. It also offers secure authentication for safe financial management.''',
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
          '''1. Developed a JavaFX application for bike management, enabling users to efficiently manage and view bike inventory.
2. The app features a user-friendly interface for easy access and control over bike details.''',
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
          '''1. NewsFlash is a JavaFX app that delivers quick, summarized news updates, inspired by Inshorts. 
2. Using JavaFX, core Java, and MySQL, it provides efficient data management and a responsive interface for local news.''',
      'projectSkills': 'Java, OOPs, JavFX, Exception Handling, UI/UX',
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
    final projectProvider = Provider.of<ProjectProvider>(context);
    bool isHovered = projectProvider.hoveredCardIndex == project['projectId'];

    return MouseRegion(
      onEnter: (event) {
        if (projectProvider.hoveredCardIndex != project['projectId']) {
          projectProvider.setHoveredCardIndex(project['projectId']);
        }
      },
      onExit: (event) {
        if (projectProvider.hoveredCardIndex != -1) {
          projectProvider.setHoveredCardIndex(-1);
        }
      },
      onHover: (event) {
        if (projectProvider.hoveredCardIndex != project['projectId']) {
          projectProvider.setHoveredCardIndex(project['projectId']);
        }
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
        child: Stack(
          children: [
            Padding(
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
                      ],
                    ),
                    const SizedBox(height: AppSpacing.standardSpacing * 2),
                    Text(
                      project['projectName'],
                      style: AppStyles.whiteTextLargeSemiBold(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
            isHovered
                ? GestureDetector(
                    onTap: () {
                      if (projectProvider.hoveredCardIndex != -1) {
                        projectProvider.setHoveredCardIndex(-1);
                      }
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
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.black.withOpacity(0.9), AppColors.darkGrey.withOpacity(0.8)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Click here for additional details.',
                            style: AppStyles.yellowText(),
                          ),
                          const SizedBox(height: AppSpacing.defaultSpacing),
                          IconButton(
                            tooltip: 'Check out the source code',
                            onPressed: () => Services.launchURL(project['projectLink']),
                            icon: Icon(Icons.open_in_new, size: 35, color: AppColors.darkYellow),
                            style: IconButton.styleFrom(backgroundColor: AppColors.darkGrey),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
