import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/profile/presentation/widget/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              Image(
                image: AssetImage('assets/images/ShopLogo.png'),
                width: 50.w,
                height: 50.h,
              ),
              Text('ShopMart'),
            ],
          ),
        ),
        body: ProfileBody(),
      ),
    );
  }
}
