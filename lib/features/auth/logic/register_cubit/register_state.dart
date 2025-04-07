import 'package:equatable/equatable.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserModel userModel;
  const RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends RegisterState {
  final String error;
  const RegisterErrorState(this.error);
}
