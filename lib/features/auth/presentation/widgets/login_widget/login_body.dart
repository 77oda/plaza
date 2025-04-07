import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/auth/presentation/widgets/login_widget/login_button.dart';
import 'package:plaza/features/auth/presentation/widgets/login_widget/login_forgetPass_button.dart';
import 'package:plaza/features/auth/presentation/widgets/login_widget/login_text_field.dart';
import 'package:plaza/features/auth/presentation/widgets/login_widget/login_to_regisrter.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppLogo(),
                SizedBox(height: 10.h),
                Text(
                  'Ahlan!...Welcome back!',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                LoginTextField(),
                SizedBox(height: 5.h),
                LoginForgetpassButton(),
                SizedBox(height: 5.h),
                LoginButton(),
                LoginToRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
