import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/home/data/model/home_model.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;

  Future<void> fetchHomeProducts() async {
    emit(HomeLoadingState());
    final result = await homeRepo.fetchHomeProducts();
    result.fold(
      (failure) => emit(HomeErrorState(failure.errMessage)),
      (home) => emit(HomeSuccessState(home)),
    );
  }
}
