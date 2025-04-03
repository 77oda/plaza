import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/auth/data/model/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });
}
