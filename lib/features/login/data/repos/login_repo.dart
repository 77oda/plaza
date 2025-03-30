import 'package:dartz/dartz.dart';
import 'package:plaza/core/errors/failures.dart';
import 'package:plaza/features/login/data/model/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<UserModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<UserModel>>> fetchSimilarBooks({
    required String category,
  });
}
