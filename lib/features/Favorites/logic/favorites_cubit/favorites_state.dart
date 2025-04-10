import 'package:equatable/equatable.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final FavoriteModel favoriteModel;
  const FavoriteSuccessState(this.favoriteModel);
}

class FavoriteErrorState extends FavoriteState {
  final String error;
  const FavoriteErrorState(this.error);
}

class FavoriteRemoveLoadingState extends FavoriteState {}

class FavoriteRemoveSuccessState extends FavoriteState {}
