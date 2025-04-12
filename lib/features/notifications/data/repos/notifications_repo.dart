import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/notifications/data/model/notifications_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsModel>> fetchNotifications();
}
