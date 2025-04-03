import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/helpers/app_regex.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_cubit.dart';
import 'package:plaza/features/auth/presentation/widgets/pass_validations.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({super.key});

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  var passwordController;
  var isObsecure = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          customFormField(
            context: context,
            controller: context.read<RegisterCubit>().nameController,
            label: 'Name',
            prefix: Icons.person,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Name field is required';
              }
            },
          ),
          SizedBox(height: 20.h),
          customFormField(
            context: context,
            controller: context.read<RegisterCubit>().phoneController,
            label: 'Phone',
            keyboardType: TextInputType.phone,
            prefix: Icons.phone,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Phone field is required';
              }
            },
          ),
          SizedBox(height: 20.h),
          customFormField(
            context: context,
            controller: context.read<RegisterCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            label: 'Email Address',
            prefix: Icons.email,
            validate: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          SizedBox(height: 20),
          customFormField(
            context: context,
            controller: context.read<RegisterCubit>().passwordController,
            label: 'Password',
            prefix: Icons.lock,
            isPassword: isObsecure,
            validate: (value) {
              if (value!.isEmpty
              // ||
              //     hasLowercase == false ||
              //     hasUppercase == false ||
              //     hasSpecialCharacters == false ||
              //     hasNumber == false ||
              //     hasMinLength == false
              ) {
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
          SizedBox(height: 20),
          customFormField(
            context: context,
            controller: context.read<RegisterCubit>().confirmPasswordController,
            label: 'Confirm Password',
            prefix: Icons.lock,
            isPassword: isObsecure,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid password';
              } else if (value !=
                  context.read<RegisterCubit>().passwordController.text) {
                return 'Password Don\'t Match';
              }
            },
            suffix: isObsecure ? Icons.visibility_off : Icons.visibility,
            suffixPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
          ),
          SizedBox(height: 10.h),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
