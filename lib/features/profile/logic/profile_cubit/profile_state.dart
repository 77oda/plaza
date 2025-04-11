part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserModel userModel;
  const ProfileSuccessState(this.userModel);
}

class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState(this.error);
}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {
  final UserModel userModel;
  const UpdateProfileSuccessState(this.userModel);
}

class UpdateProfileErrorState extends ProfileState {
  final String error;
  const UpdateProfileErrorState(this.error);
}
