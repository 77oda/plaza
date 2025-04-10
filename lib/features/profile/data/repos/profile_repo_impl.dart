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
}
