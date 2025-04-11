import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/utils/app_router.dart';

class ProfileSecurityInfo extends StatelessWidget {
  const ProfileSecurityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SECURITY INFORMATION',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: ColorsManager.gray),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              shadowColor: Colors.red, // لون الشادو
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.changePassScreen);
            },
            child: Text(
              'Change Password',
              style: TextStyle(color: ColorsManager.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
