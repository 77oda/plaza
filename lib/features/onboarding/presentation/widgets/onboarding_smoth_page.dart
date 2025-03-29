import 'package:flutter/material.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSmothPage extends StatelessWidget {
  PageController onBoardController;
  late bool isLast;
  OnboardingSmothPage({
    super.key,
    required this.onBoardController,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SmoothPageIndicator(
          controller: onBoardController,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: ColorsManager.primaryColor,
            expansionFactor: 4,
            dotHeight: 10,
            dotWidth: 20,
            spacing: 10,
          ),
          count: 3,
        ),
        const Spacer(),
        FloatingActionButton(
          backgroundColor: ColorsManager.primaryColor,
          onPressed: () {
            if (isLast) {
              // CacheHelper.saveData(key: 'ShowOnBoard', value: false).then((value)
              // {
              //   if(value) {
              //     navigateAndKill(context, LoginScreen());
              //   }
              // });
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
