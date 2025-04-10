import 'package:bloc/bloc.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';
import 'package:plaza/features/home/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;

  Map<dynamic, dynamic> favorites = {};

  Future<void> fetchHomeProducts() async {
    emit(HomeLoadingState());
    final result = await homeRepo.fetchHomeProducts();
    result.fold((failure) => emit(HomeErrorState(failure.errMessage)), (home) {
      for (var element in home.data!.products) {
        favorites.addAll({element.id: element.inFavorites});
        print(element.id);
      }
      emit(HomeSuccessState(home));
    });
  }
}
