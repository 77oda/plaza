import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
}
