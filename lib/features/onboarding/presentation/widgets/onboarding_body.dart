import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_smoth_page.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController onBoardController = PageController();

  @override
  // void initState() {
  //   super.initState();
  //   // onBoardController.addListener(() {
  //   //   setState(() {});
  //   // });
  // }
  @override
  void dispose() {
    onBoardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingPageView(onBoardController: onBoardController),
          OnboardingSmothPage(onBoardController: onBoardController),
        ],
      ),
    );
  }
}
