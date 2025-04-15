import 'package:bloc/bloc.dart';
import 'package:plaza/features/Favorites/data/repos/favorites_repo.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_state.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  ToggleFavoriteCubit(this.favoritesRepo, this.allProductsCubit)
    : super(ToggleFavoriteInitial());
  final FavoritesRepo favoritesRepo;
  final AllProductsCubit allProductsCubit;

  Future<void> toggleFavorite(int productId) async {
    if (allProductsCubit.favorites.containsKey(productId)) {
      allProductsCubit.favorites[productId] =
          !allProductsCubit.favorites[productId]!;
    } else {
      allProductsCubit.favorites[productId] = true;
    }
    emit(ToggleFavoriteLoadingState());

    final result = await favoritesRepo.toggleFavorite(productId);
    result.fold(
      (failure) {
        allProductsCubit.favorites[productId] =
            !allProductsCubit.favorites[productId]!;
        emit(ToggleFavoriteErrorState(failure.errMessage));
      },
      (toggleFavorites) {
        if (toggleFavorites.status == false) {
          allProductsCubit.favorites[productId] =
              !allProductsCubit.favorites[productId]!;
        }
        emit(ToggleFavoriteSuccessState(toggleFavorites));
      },
    );
  }
}
