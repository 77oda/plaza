import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_smoth_page.dart';

bool isLast = false;

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});

  final PageController onBoardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingPageView(
            onBoardController: onBoardController,
            // isLast: isLast,
          ),
          OnboardingSmothPage(
            onBoardController: onBoardController,
            // isLast: isLast,
          ),
        ],
      ),
    );
  }
}
