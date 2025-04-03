// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/utils/constants.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_state.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState)
          // ignore: curly_braces_in_flow_control_structures
          if (state.userModel.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.userModel.data?.token,
            ).then((value) {
              // token = state.userModel.data?.token;
              context.read<RegisterCubit>().emailController.clear();
              context.read<RegisterCubit>().passwordController.clear();
              context.read<RegisterCubit>().nameController.clear();
              context.read<RegisterCubit>().confirmPasswordController.clear();
              context.read<RegisterCubit>().phoneController.clear();
              // navigateAndKill(context, ShopLayout());
              // ShopCubit.get(context).currentIndex = 0;
              // ShopCubit.get(context).getHomeData();
              // ShopCubit.get(context).getProfileData();
              // ShopCubit.get(context).getFavoriteData();
              // ShopCubit.get(context).getCartData();
              // ShopCubit.get(context).getAddresses();
            });
          } else {
            showToast(state.userModel.message);
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
