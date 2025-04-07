import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/helpers/app_regex.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  var isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          customFormField(
            context: context,
            controller: context.read<LoginCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            label: 'Email Address',
            prefix: Icons.email,
            validate: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          SizedBox(height: 20.h),
          customFormField(
            context: context,
            controller: context.read<LoginCubit>().passwordController,
            label: 'Password',
            prefix: Icons.lock,
            isPassword: isObsecure,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            suffix: isObsecure ? Icons.visibility_off : Icons.visibility,
            suffixPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
          ),
        ],
      ),
    );
  }
}
