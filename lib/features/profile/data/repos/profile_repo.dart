import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> fetchProfileData();
}
