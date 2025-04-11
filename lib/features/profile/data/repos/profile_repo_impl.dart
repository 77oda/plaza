import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';
import 'package:plaza/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, UserModel>> fetchProfileData() async {
    try {
      final response = await apiService.getData(endPoint: ApiEndPoints.profile);
      return right(UserModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfileData(
    String name,
    String phone,
    String email,
  ) async {
    try {
      final response = await apiService.putData(
        endPoint: ApiEndPoints.updateProfile,
        data: {'name': name, 'phone': phone, 'email': email},
      );
      return right(UserModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> changePass(
    String currentPass,
    String newPass,
  ) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiEndPoints.changePassword,
        data: {'current_password': currentPass, 'new_password': newPass},
      );
      return right(UserModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
