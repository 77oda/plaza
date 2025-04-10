import 'package:equatable/equatable.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';
import 'package:plaza/features/Favorites/data/model/toggle_favorite_model.dart';

sealed class ToggleFavoriteState extends Equatable {
  const ToggleFavoriteState();

  @override
  List<Object> get props => [];
}

final class ToggleFavoriteInitial extends ToggleFavoriteState {}

// class FavoriteLoadingState extends ToggleFavoriteState {}

// class FavoriteSuccessState extends ToggleFavoriteState {
//   final FavoriteModel favoriteModel;
//   const FavoriteSuccessState(this.favoriteModel);
// }

// class FavoriteErrorState extends ToggleFavoriteState {
//   final String error;
//   const FavoriteErrorState(this.error);
// }

class ToggleFavoriteLoadingState extends ToggleFavoriteState {}

class ToggleFavoriteSuccessState extends ToggleFavoriteState {
  final ToggleFavoritesModel changeToFavoritesModel;
  const ToggleFavoriteSuccessState(this.changeToFavoritesModel);
}

class ToggleFavoriteErrorState extends ToggleFavoriteState {
  final String error;
  const ToggleFavoriteErrorState(this.error);
}
