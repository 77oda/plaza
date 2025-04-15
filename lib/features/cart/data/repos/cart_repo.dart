import 'package:dartz/dartz.dart';
import 'package:plaza/core/networking/api_failures.dart';

import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/data/model/toggle_cart_model.dart';
import 'package:plaza/features/cart/data/model/update_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> fetchCartproducts();
  Future<Either<Failure, ToggleCartModel>> toggleCartProduct(int productId);
  Future<Either<Failure, UpdateCartModel>> updateCartProduct(
    int id,
    int quantity,
  );
}
