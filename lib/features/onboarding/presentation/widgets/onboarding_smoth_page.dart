import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingSmothPage extends StatelessWidget {
  PageController onBoardController;
  OnboardingSmothPage({super.key, required this.onBoardController});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SmoothPageIndicator(
          controller: onBoardController,
          effect: ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: ColorsManager.primaryColor,
            expansionFactor: 4,
            dotHeight: 10.h,
            dotWidth: 20.w,
            spacing: 10,
          ),
          count: 3,
        ),
        const Spacer(),
        FloatingActionButton(
          backgroundColor: ColorsManager.primaryColor,
          onPressed: () {
            if (onBoardController.page == 2) {
              CacheHelper.setData(key: 'onBoarding', value: true).then((value) {
                if (value) {
                  GoRouter.of(context).pushReplacement(AppRouter.loginScreen);
                }
              });
            } else {
              onBoardController.nextPage(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }
          },
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
