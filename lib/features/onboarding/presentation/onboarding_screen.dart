import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/widgets/separator.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35.h,
        actions: [
          TextButton(
            onPressed: () {
              // CacheHelper.saveData(key: 'ShowOnBoard', value: false).then((value){
              //   if(value) {
              //     // ignore: use_build_context_synchronously
              //     navigateAndKill(context, LoginScreen());
              //   }
              // });
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                letterSpacing: 1,
                color: ColorsManager.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: OnboardingBody(),
    );
  }
}
