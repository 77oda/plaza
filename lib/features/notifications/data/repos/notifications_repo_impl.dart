import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plaza/core/networking/api_endPoints.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/notifications/data/model/notifications_model.dart';
import 'package:plaza/features/notifications/data/repos/notifications_repo.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  final ApiService apiService;
  NotificationsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, NotificationsModel>> fetchNotifications() async {
    try {
      final response = await apiService.getData(
        endPoint: ApiEndPoints.notifications,
      );
      return right(NotificationsModel.fromJson(response.data));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
