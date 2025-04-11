import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';
import 'package:plaza/features/profile/data/repos/profile_repo.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this.profileRepo) : super(ChangePassInitial());
  final ProfileRepo profileRepo;
  Future<void> changePass(String currentPass, String newPass) async {
    emit(ChangePassLoadingState());
    final result = await profileRepo.changePass(currentPass, newPass);
    result.fold(
      (failure) => emit(ChangePassErrorState(failure.errMessage)),
      (profile) => emit(ChangePassSuccessState(profile)),
    );
  }
}
