import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
  final RegisterRepo registerRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final result = await registerRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
      (failure) => emit(RegisterErrorState(failure.errMessage)),
      (user) => emit(RegisterSuccessState(user)),
    );
  }

  // bool showPassword = true;
  // IconData suffixIcon = Icons.visibility;
  // void changeSuffixIcon(context){
  //   showPassword =! showPassword;
  //   if(showPassword==false)
  //     suffixIcon = Icons.visibility_off;
  //   else
  //     suffixIcon = Icons.visibility;
  //   emit(ChangeSuffixIconState());
  // }

  // bool showConfirmPassword = true;
  // IconData confirmSuffixIcon = Icons.visibility;
  // void changeConfirmSuffixIcon(context){
  //   showConfirmPassword =! showConfirmPassword;
  //   if(showConfirmPassword==false)
  //     confirmSuffixIcon = Icons.visibility_off;
  //   else
  //     confirmSuffixIcon = Icons.visibility;
  //   emit(ChangeSuffixIconState());
  // }
}
