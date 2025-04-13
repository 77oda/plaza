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
      (failure) {
        if (!isClosed) emit(ProfileErrorState(failure.errMessage));
      },
      (profile) {
        if (!isClosed) emit(ProfileSuccessState(profile));
      },
    );
  }

  Future<void> updateProfileData(
    String name,
    String phone,
    String email,
  ) async {
    emit(UpdateProfileLoadingState());
    final result = await profileRepo.updateProfileData(name, phone, email);
    result.fold(
      (failure) => emit(UpdateProfileErrorState(failure.errMessage)),
      (profile) => emit(UpdateProfileSuccessState(profile)),
    );
  }
}
