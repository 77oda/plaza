/*************  ✨ Codeium Command 🌟  *************/
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo, this.apiService) : super(LoginInitialState());
  final ApiService apiService;
  final LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await loginRepo.signIn(email: email, password: password);
    result.fold((failure) => emit(LoginErrorState(failure.errMessage)), (
      user,
    ) async {
      await saveUserToken(user.data!.token!);
      emit(LoginSuccessState(user));
    });
  }

  Future<void> saveUserToken(String token) async {
    await CacheHelper.setSecuredString('token', token);
    apiService.setTokenAfterLogin(token);
  }
}
