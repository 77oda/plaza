import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/categories/data/model/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesModel>> fetchCategories();
}
