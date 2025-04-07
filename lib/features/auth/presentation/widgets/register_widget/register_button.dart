// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_state.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState)
          if (state.userModel.status) {
            showToast('Register Successfully');
            GoRouter.of(context).pop();
          } else {
            showToast(state.userModel.message);
          }
        if (state is RegisterErrorState) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return state is RegisterLoadingState
            ? Center(child: CircularProgressIndicator())
            : customButton(
              onTap: () {
                if (context
                    .read<RegisterCubit>()
                    .registerFormKey
                    .currentState!
                    .validate()) {
                  context.read<RegisterCubit>().signUp(
                    name: context.read<RegisterCubit>().nameController.text,
                    phone: context.read<RegisterCubit>().phoneController.text,
                    email: context.read<RegisterCubit>().emailController.text,
                    password:
                        context.read<RegisterCubit>().passwordController.text,
                  );
                }
              },
              text: 'Sign Up',
            );
      },
    );
  }
}
