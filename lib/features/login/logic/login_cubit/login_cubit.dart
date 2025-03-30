import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:plaza/core/utils/api_service.dart';
import 'package:plaza/features/login/data/model/user_model.dart';
import 'package:plaza/features/login/logic/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // static LoginCubit get(context) => BlocProvider.of(context);

  // UserModel? loginModel;
  // void signIn({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(
  //       url: LOGIN,
  //       token: token,
  //       data:
  //       {
  //         'email': '$email',
  //         'password': '$password',
  //       }).then((value) {
  //         loginModel = UserModel.fromJson(value.data);
  //         emit(LoginSuccessState(loginModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(LoginErrorState());
  //   });
  // }
  // // LogOutModel? fcmTokenModel;
  // // void setFCM_Token(){
  // //   emit(FCMLoadingState());
  // //   DioHelper.postData(
  // //       url: 'fcm-token',
  // //       token: token,
  // //       data:
  // //       {
  // //        "token" : token
  // //       }).then((value) {
  // //     fcmTokenModel = LogOutModel.fromJson(value.data);
  // //     emit(FCMSuccessState(fcmTokenModel!));
  // //   }).catchError((error) {
  // //     print(error.toString());
  // //     emit(FCMErrorState());
  // //   });
  // // }

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
}
