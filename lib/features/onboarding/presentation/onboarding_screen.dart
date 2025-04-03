import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35.h,
          actions: [
            TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'ShowOnBoard', value: false).then((
                  value,
                ) {
                  if (value) {
                    GoRouter.of(context).pushReplacement(AppRouter.loginScreen);
                  }
                });
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
      ),
    );
  }
}
