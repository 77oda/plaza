import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await ApiService.postData(
        endPoint: ApiEndPoints.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
      );
      return right(UserModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
