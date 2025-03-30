import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/features/login/presentation/widgets/auth_logo.dart';
import 'package:plaza/features/login/presentation/widgets/login_forgetPass_button.dart';
import 'package:plaza/features/login/presentation/widgets/login_register_button.dart';
import 'package:plaza/features/login/presentation/widgets/login_text_field.dart';

class LoginBody extends StatelessWidget {
  var loginFormKey = GlobalKey<FormState>();
  late var state;
  LoginBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: loginFormKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AuthLogo(),
                  SizedBox(height: 30),
                  Text(
                    'Ahlan! Welcome back!',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  LoginTextField(),
                  LoginForgetpassButton(),
                  SizedBox(height: 25),
                  // state is LoginLoadingState
                  // ? Center(child: CircularProgressIndicator())
                  // :
                  customButton(
                    text: 'LOGIN',
                    onTap: () {
                      if (loginFormKey.currentState!.validate()) {
                        // LoginCubit.get(context).signIn(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                        // token = CacheHelper.getData('token');
                      }
                    },
                  ),
                  LoginRegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
