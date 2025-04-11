import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';
import 'package:plaza/features/home/data/model/banners_model.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BannersModel>> fetchBanners();
  Future<Either<Failure, ProductsModel>> fetchAllProducts();
}
