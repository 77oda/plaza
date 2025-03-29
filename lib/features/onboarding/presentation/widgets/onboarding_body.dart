import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_smoth_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});

  final PageController onBoardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingPageView(
            onBoardController: onBoardController,
            isLast: isLast,
          ),
          OnboardingSmothPage(
            onBoardController: onBoardController,
            isLast: isLast,
          ),
        ],
      ),
    );
  }
}
