import 'package:equatable/equatable.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel loginUserModel;
  const LoginSuccessState(this.loginUserModel);
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(this.error);
}
