import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/ShopLogo.png', width: 40.w, height: 40.h),
        Text('ShopMart', style: TextStyle(fontSize: 22.sp)),
      ],
    );
  }
}
