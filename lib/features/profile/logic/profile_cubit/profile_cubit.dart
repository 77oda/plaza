import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';
import 'package:plaza/features/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> fetchProfileData() async {
    emit(ProfileLoadingState());
    final result = await profileRepo.fetchProfileData();
    result.fold(
      (failure) => emit(ProfileErrorState(failure.errMessage)),
      (profile) => emit(ProfileSuccessState(profile)),
    );
  }
}
