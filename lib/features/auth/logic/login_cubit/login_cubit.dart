/*************  ✨ Codeium Command 🌟  *************/
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  final LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await loginRepo.signIn(email: email, password: password);
    result.fold(
      (failure) => emit(LoginErrorState(failure.errMessage)),
      (user) => emit(LoginSuccessState(user)),
    );
  }
}
