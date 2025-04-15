import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/data/model/toggle_cart_model.dart';
import 'package:plaza/features/cart/data/model/update_cart_model.dart';
import 'package:plaza/features/cart/data/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiService apiService;
  CartRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CartModel>> fetchCartproducts() async {
    try {
      final response = await apiService.getData(endPoint: ApiEndPoints.carts);
      return right(CartModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ToggleCartModel>> toggleCartProduct(
    int productId,
  ) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiEndPoints.carts,
        data: {'product_id': '$productId'},
      );
      return right(ToggleCartModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCartModel>> updateCartProduct(
    int id,
    int quantity,
  ) async {
    try {
      final response = await apiService.putData(
        endPoint: '${ApiEndPoints.carts}/$id',
        data: {'quantity': quantity},
      );
      return right(UpdateCartModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
