import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginUserModel.status) {
            GoRouter.of(context).pushReplacement(AppRouter.layoutScreen);
          } else {
            showToast(state.loginUserModel.message);
          }
        }
        if (state is LoginErrorState) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        return state is LoginLoadingState
            ? Center(child: CircularProgressIndicator())
            : customButton(
              text: 'LOGIN',
              onTap: () {
                if (context
                    .read<LoginCubit>()
                    .loginFormKey
                    .currentState!
                    .validate()) {
                  BlocProvider.of<LoginCubit>(context).signIn(
                    email: context.read<LoginCubit>().emailController.text,
                    password:
                        context.read<LoginCubit>().passwordController.text,
                  );
                }
              },
            );
      },
    );
  }
}
