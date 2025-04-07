import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/ShopLogo.png', width: 50.w, height: 50.h),
        Text('ShopMart', style: TextStyle(fontSize: 22.sp)),
      ],
    );
  }
}
