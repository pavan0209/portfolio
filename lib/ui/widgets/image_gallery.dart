import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:portfolio/common/styles/index.dart';

class ImageGallery extends StatefulWidget {
  final List<String> imgList;
  final String projectName;
  const ImageGallery({super.key, required this.imgList, required this.projectName});

  @override
  ImageGalleryState createState() => ImageGalleryState();
}

class ImageGalleryState extends State<ImageGallery> {
  PageController pageController = PageController();
  Timer? _timer;
  int nextPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Function to automatically move to the next image every few seconds
  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (nextPage < widget.imgList.length - 1) {
        nextPage++;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: isSmallScreen ? double.infinity : screenWidth * 0.6,
              maxHeight: isSmallScreen ? 400 : screenHeight * 0.7,
            ),
            padding: const EdgeInsets.all(AppPadding.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: AppColors.darkYellow,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.projectName,
                  softWrap: true,
                  style: AppStyles.whiteTextLargeSemiBold(),
                ),

                const SizedBox(height: AppSpacing.largeSpacing),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: widget.imgList.length,
                    itemBuilder: (context, index) {
                      return InteractiveViewer(
                        child: Image.asset(
                          widget.imgList[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Smooth Indicator
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: widget.imgList.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      spacing: 8.0,
                      activeDotColor: AppColors.darkYellow,
                      dotColor: AppColors.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: IconButton.styleFrom(
                backgroundColor: AppColors.darkGrey,
              ),
              padding: const EdgeInsets.all(AppPadding.smallPadding / 2),
              icon: Icon(
                Icons.close,
                color: AppColors.darkYellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
