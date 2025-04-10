import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/products/data/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProductsModel>> fetchProducts(categoryId) async {
    try {
      final response = await apiService.getData(
        endPoint: ApiEndPoints.products,
        query: {'category_id': '$categoryId'},
      );
      return right(ProductsModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  // @override
  // Future<Either<Failure, ProductData>> fetchProductDetails(int productId) async{
  //   try {
  //     final response = await apiService.getData(
  //       endPoint: ApiEndPoints.products,
  //       query: {'product_id': '$productId'},
  //     );
  //     return right(ProductsModel.fromJson(response.data));
  //   } on DioException catch (error) {
  //     return left(ServerFailure.fromDioError(error));
  //   } catch (error) {
  //     return left(ServerFailure(error.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, ToggleFavoritesModel>> toggleFavorite(
  //   int productId,
  // ) async {
  //   try {
  //     final response = await apiService.postData(
  //       endPoint: ApiEndPoints.favorites,
  //       query: {'product_id': '$productId'},
  //     );
  //     return right(ToggleFavoritesModel.fromJson(response.data));
  //   } on DioException catch (error) {
  //     return left(ServerFailure.fromDioError(error));
  //   } catch (error) {
  //     return left(ServerFailure(error.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, FavoriteModel>> fetchFavoriteProducts() async {
  //   try {
  //     final response = await apiService.getData(
  //       endPoint: ApiEndPoints.favorites,
  //     );
  //     return right(FavoriteModel.fromJson(response.data));
  //   } on DioException catch (error) {
  //     return left(ServerFailure.fromDioError(error));
  //   } catch (error) {
  //     return left(ServerFailure(error.toString()));
  //   }
  // }
}
