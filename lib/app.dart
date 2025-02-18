import 'package:flutter/material.dart';

import 'package:portfolio/common/styles/index.dart';
import 'package:portfolio/common/utils/index.dart';
import 'package:portfolio/ui/mixin/index.dart';
import 'package:portfolio/ui/screens/index.dart';

class MainApp extends BasePage {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends BaseState<MainApp> with BasicPage {
  int? activeIndex = 0;
  int? hoveredMenuIndex;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Change Active Index on scroll
  void _onScroll() {
    final offset = _scrollController.offset;
    final sectionPositions = [
      _getPosition(_homeKey),
      _getPosition(_aboutKey),
      _getPosition(_projectKey),
      _getPosition(_contactKey),
    ];

    for (int i = sectionPositions.length - 1; i >= 0; i--) {
      if (offset >= sectionPositions[i] - MediaQuery.of(context).size.height * 0.3) {
        if (activeIndex != i) {
          setState(() {
            activeIndex = i;
          });
        }
        break;
      }
    }
  }

  double _getPosition(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
    return position.dy + _scrollController.offset;
  }

  // Scroll to the specified position
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget body(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return RefreshIndicator(
      color: AppColors.darkYellow,
      backgroundColor: AppColors.darkGrey,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Home Section
            Container(
              key: _homeKey,
              margin: EdgeInsets.only(top: isSmallScreen ? AppPadding.standardPadding / 2 : 0),
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              height: isSmallScreen ? screenHeight : screenHeight - 80,
              child: const Center(
                child: HomeSection(),
              ),
            ),
            const SizedBox(height: AppSpacing.extraSpacing),
            if (screenHeight < 600) const SizedBox(height: AppSpacing.extraSpacing),

            // About Me Section
            Wrap(
              key: _aboutKey,
              spacing: 100,
              runSpacing: 50,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
                  child: AboutSection(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
                  decoration: BoxDecoration(
                      color: AppColors.darkGrey.withOpacity(0.6), borderRadius: BorderRadius.circular(20)),
                  height: screenWidth < 1000 ? 300 : 600,
                  width: screenWidth < 1000 ? 300 : 400,
                  child: Image.asset(AppImageAssets.userAvatarMac),
                ),
              ],
            ),
          
            // Projects Section
            const SizedBox(height: AppSpacing.defaultSpacing),
            Padding(
              key: _projectKey,
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 1000 ? AppPadding.defaultPadding : AppPadding.defaultPadding),
              child: const ProjectsSection(),
            ),

            // Contact Section
            const SizedBox(height: AppSpacing.extraSpacing * 2),
            Container(
              key: _contactKey,
              child: const ContactSection(),
            ),
            const SizedBox(height: AppSpacing.extraSpacing * 2),

             // Copyright section
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget getAppBar(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width <= 600 ? 40 : 50;
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width <= 800 ? 0 : 200),
        child: Image.asset(
          AppImageAssets.appLogo,
          height: iconSize,
          width: iconSize,
        ),
      ),
      actions: [
        // Desktop Screen
        if (MediaQuery.of(context).size.width > 600)
          Row(
            children: [
              _buildMenuItem('Home', context, 0),
              _buildMenuItem('About', context, 1),
              _buildMenuItem('Projects', context, 2),
              _buildMenuItem('Contact', context, 3),
              const SizedBox(width: 20),
            ],
          ),
        // Mobile Screen
        if (MediaQuery.of(context).size.width <= 600)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
          ),
      ],
    );
  }

  Widget _buildMenuItem(String title, BuildContext context, int index) {
    bool isHovered = hoveredMenuIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.smallPadding),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            hoveredMenuIndex = index;
          });
        },
        onExit: (event) {
          setState(() {
            hoveredMenuIndex = null;
          });
        },
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              activeIndex = index;
              switch (activeIndex) {
                case 0:
                  _scrollToSection(_homeKey);
                case 1:
                  _scrollToSection(_aboutKey);
                case 2:
                  _scrollToSection(_projectKey);
                case 3:
                  _scrollToSection(_contactKey);
              }
            });
          },
          style: OutlinedButton.styleFrom(
              side: BorderSide(
            color: isHovered || activeIndex == index ? AppColors.darkYellow : AppColors.transparent,
          )),
          child: Text(
            title,
            style: AppStyles.whiteTextLarge(),
          ),
        ),
      ),
    );
  }

  @override
  Widget? getEndDrawer(BuildContext context) {
    return Drawer(
      width: 200,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
      shadowColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            tileColor: AppColors.black,
            // title: const Text('Menu'),
            // titleTextStyle: AppStyles.whiteTextLarge(),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(AppPadding.smallPadding / 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkGrey,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.darkYellow,
                ),
              ),
            ),
          ),
          _buildDrawerItem('Home', context, 0),
          _buildDrawerItem('About', context, 1),
          _buildDrawerItem('Projects', context, 2),
          _buildDrawerItem('Contact', context, 3, isLastMenu: true),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    String title,
    BuildContext context,
    int index, {
    bool? isLastMenu = false,
  }) {
    return ListTile(
      tileColor: AppColors.black,
      shape: isLastMenu!
          ? const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)))
          : null,
      title: OutlinedButton(
        onPressed: () {
          setState(() {
            activeIndex = index;
            Navigator.pop(context);

            switch (activeIndex) {
              case 0:
                _scrollToSection(_homeKey);
              case 1:
                _scrollToSection(_aboutKey);
              case 2:
                _scrollToSection(_projectKey);
              case 3:
                _scrollToSection(_contactKey);
            }
          });
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide(
          color: activeIndex == index ? AppColors.darkYellow : AppColors.transparent,
        )),
        child: Text(
          title,
          style: AppStyles.whiteTextLarge(),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
