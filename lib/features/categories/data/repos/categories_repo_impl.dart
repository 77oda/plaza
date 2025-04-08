import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/categories/data/repos/categories_repo.dart';
import 'package:plaza/features/categories/data/model/categories_model.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final ApiService apiService;

  CategoriesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CategoriesModel>> fetchCategories() async {
    try {
      final response = await apiService.getData(
        endPoint: ApiEndPoints.categories,
      );
      return right(CategoriesModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
