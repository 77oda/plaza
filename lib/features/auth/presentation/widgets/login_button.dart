import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/utils/constants.dart';
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
            CacheHelper.saveData(
              key: 'token',
              value: state.loginUserModel.data?.token,
            ).then((value) {
              // token = state.loginUserModel.data?.token;
              // navigateAndKill(context, ShopLayout());
              context.read<LoginCubit>().emailController.clear();
              context.read<LoginCubit>().passwordController.clear();
              // ShopCubit.get(context).currentIndex = 0;
              // ShopCubit.get(context).getHomeData();
              // ShopCubit.get(context).getProfileData();
              // ShopCubit.get(context).getFavoriteData();
              // ShopCubit.get(context).getCartData();
              // ShopCubit.get(context).getAddresses();
            });
          } else {
            showToast(state.loginUserModel.message);
          }
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
                  // token = CacheHelper.getData('token');
                }
              },
            );
      },
    );
  }
}
