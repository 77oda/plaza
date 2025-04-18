import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/home/data/model/banners_model.dart';
import 'package:plaza/features/home/data/model/home_model.dart';
import 'package:plaza/features/home/data/repos/home_repo.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BannersModel>> fetchBanners() async {
    try {
      final response = await apiService.getData(endPoint: ApiEndPoints.banners);
      return right(BannersModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> fetchAllProducts() async {
    try {
      final response = await apiService.getData(
        endPoint: ApiEndPoints.products,
      );
      return right(ProductsModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
