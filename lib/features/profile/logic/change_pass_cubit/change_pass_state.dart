part of 'change_pass_cubit.dart';

sealed class ChangePassState extends Equatable {
  const ChangePassState();

  @override
  List<Object> get props => [];
}

final class ChangePassInitial extends ChangePassState {}

class ChangePassLoadingState extends ChangePassState {}

class ChangePassSuccessState extends ChangePassState {
  final UserModel userModel;
  const ChangePassSuccessState(this.userModel);
}

class ChangePassErrorState extends ChangePassState {
  final String error;
  const ChangePassErrorState(this.error);
}
