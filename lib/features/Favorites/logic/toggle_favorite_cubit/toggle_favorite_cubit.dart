import 'package:bloc/bloc.dart';
import 'package:plaza/features/Favorites/data/model/toggle_favorite_cubit/toggle_favorite_state.dart';
import 'package:plaza/features/Favorites/data/repos/favorites_repo.dart';
import 'package:plaza/features/home/logic/home_cubit/home_cubit.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  ToggleFavoriteCubit(this.favoritesRepo, this.homeCubit)
    : super(ToggleFavoriteInitial());
  final FavoritesRepo favoritesRepo;
  final HomeCubit homeCubit;

  Future<void> toggleFavorite(int productId) async {
    if (homeCubit.favorites.containsKey(productId)) {
      homeCubit.favorites[productId] = !homeCubit.favorites[productId]!;
    } else {
      homeCubit.favorites[productId] = true;
    }
    emit(ToggleFavoriteLoadingState());

    final result = await favoritesRepo.toggleFavorite(productId);
    result.fold(
      (failure) {
        homeCubit.favorites[productId] = !homeCubit.favorites[productId]!;
        emit(ToggleFavoriteErrorState(failure.errMessage));
      },
      (toggleFavorites) {
        if (toggleFavorites.status == false) {
          homeCubit.favorites[productId] = !homeCubit.favorites[productId]!;
        } else {
          // getFavoriteData();
        }
        emit(ToggleFavoriteSuccessState(toggleFavorites));
      },
    );
  }
}
