import 'package:bloc/bloc.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';
import 'package:plaza/features/Favorites/data/repos/favorites_repo.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_cubit.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoritesRepo, this.toggleFavoriteCubit)
    : super(FavoriteInitial());
  final FavoritesRepo favoritesRepo;
  final ToggleFavoriteCubit toggleFavoriteCubit;

  List<FavoriteData> favorites = [];

  Future<void> fetchFavoriteProducts() async {
    emit(FavoriteLoadingState());
    final result = await favoritesRepo.fetchFavoriteProducts();
    result.fold(
      (failure) {
        if (!isClosed) emit(FavoriteErrorState(failure.errMessage));
      },
      (favorite) {
        for (var element in favorite.data!.data!) {
          favorites.add(element);
        }
        if (!isClosed) emit(FavoriteSuccessState(favorite));
      },
    );
  }

  void removeFavoriteLocally(int productId) {
    emit(FavoriteRemoveLoadingState());
    toggleFavoriteCubit.toggleFavorite(productId);
    favorites.removeWhere((item) => item.product!.id == productId);
    emit(FavoriteRemoveSuccessState());
  }
}
