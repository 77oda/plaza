import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/auth/presentation/widgets/register_widget/register_button.dart';
import 'package:plaza/features/auth/presentation/widgets/register_widget/register_text_field.dart';
import 'package:plaza/features/auth/presentation/widgets/register_widget/register_to_login.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              SizedBox(height: 10.h),
              Text(
                'Create a ShopMart Account',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              RegisterTextField(),
              SizedBox(height: 20.h),
              RegisterButton(),
              RegisterToLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
