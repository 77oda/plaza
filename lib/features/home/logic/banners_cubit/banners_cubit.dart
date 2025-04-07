import 'package:bloc/bloc.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepo) : super(BannersInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchBanners() async {
    emit(BannersLoadingState());
    final result = await homeRepo.fetchBanners();
    result.fold(
      (failure) => emit(BannersErrorState(failure.errMessage)),
      (banners) => emit(BannersSuccessState(banners)),
    );
  }
}
