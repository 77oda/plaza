import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/Favorites/data/model/favorite_model.dart';
import 'package:plaza/features/Favorites/data/model/toggle_favorite_model.dart';
import 'package:plaza/features/Favorites/data/repos/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final ApiService apiService;
  FavoritesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ToggleFavoritesModel>> toggleFavorite(
    int productId,
  ) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiEndPoints.favorites,
        query: {'product_id': '$productId'},
      );
      return right(ToggleFavoritesModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> fetchFavoriteProducts() async {
    try {
      final response = await apiService.getData(
        endPoint: ApiEndPoints.favorites,
      );
      return right(FavoriteModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
