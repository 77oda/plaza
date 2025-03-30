import 'package:equatable/equatable.dart';
import 'package:plaza/features/login/data/model/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel loginUserModel;
  const LoginSuccessState(this.loginUserModel);
}

class LoginErrorState extends LoginState {}
