import 'package:flutter/material.dart';
import 'package:plaza/features/login/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/login/logic/login_cubit/login_state.dart';
import 'package:plaza/features/login/presentation/widgets/login_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  get obscureText => null;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginUserModel.status) {
              // CacheHelper.saveData(
              //   key: 'token',
              //   value: state.loginUserModel.data?.token,
              // ).then((value) {
              //   token = state.loginUserModel.data?.token;
              //   navigateAndKill(context, ShopLayout());
              //   emailController.clear();
              //   passwordController.clear();
              //   ShopCubit.get(context).currentIndex = 0;
              //   ShopCubit.get(context).getHomeData();
              //   ShopCubit.get(context).getProfileData();
              //   ShopCubit.get(context).getFavoriteData();
              //   ShopCubit.get(context).getCartData();
              //   ShopCubit.get(context).getAddresses();
              // });
            }
            // else
            // showToast(state.loginUserModel.message);
          }
        },
        builder: (context, state) {
          // LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(body: LoginBody(state: state));
        },
      ),
    );
  }
}
