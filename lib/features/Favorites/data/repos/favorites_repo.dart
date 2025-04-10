import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';
import 'package:plaza/features/Favorites/data/model/toggle_favorite_model.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, FavoriteModel>> fetchFavoriteProducts();
  Future<Either<Failure, ToggleFavoritesModel>> toggleFavorite(int productId);
}
