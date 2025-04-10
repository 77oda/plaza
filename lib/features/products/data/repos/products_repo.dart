import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsModel>> fetchProducts(int categoryId);
  // Future<Either<Failure, FavoriteModel>> fetchFavoriteProducts();
  // Future<Either<Failure, ToggleFavoritesModel>> toggleFavorite(int productId);
  //  Future<Either<Failure, ProductData>> fetchProductDetails(int productId);
}
