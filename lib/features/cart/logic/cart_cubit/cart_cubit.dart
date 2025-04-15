import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/data/model/toggle_cart_model.dart';
import 'package:plaza/features/cart/data/model/update_cart_model.dart';
import 'package:plaza/features/cart/data/repos/cart_repo.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo, this.allProductsCubit) : super(CartInitial());
  final AllProductsCubit allProductsCubit;
  final CartRepo cartRepo;

  CartData? cartProducts;

  Future<void> fetchCartproducts() async {
    emit(CartLoadingState());
    final result = await cartRepo.fetchCartproducts();
    result.fold(
      (failure) {
        if (!isClosed) emit(CartErrorState(failure.errMessage));
      },
      (cart) {
        cartProducts = cart.data;
        if (!isClosed) emit(CartSuccessState(cart));
      },
    );
  }

  Future<void> toggleCartProduct(int productId) async {
    if (allProductsCubit.cartProducts.containsKey(productId)) {
      allProductsCubit.cartProducts[productId] =
          !allProductsCubit.cartProducts[productId]!;
    } else {
      allProductsCubit.cartProducts[productId] = true;
    }
    emit(ToggleCartLoadingState());
    final result = await cartRepo.toggleCartProduct(productId);
    result.fold(
      (failure) {
        allProductsCubit.cartProducts[productId] =
            !allProductsCubit.cartProducts[productId]!;
        if (!isClosed) emit(ToggleCartErrorState(failure.errMessage));
      },
      (cart) async {
        if (cart.status == false) {
          allProductsCubit.cartProducts[productId] =
              !allProductsCubit.cartProducts[productId]!;
        }
        if (cart.message!.contains('Added')) {
          cartProducts?.cartItems.add(cart.data!);
        }
        if (!isClosed) emit(ToggleCartSuccessState(cart));
      },
    );
  }

  Future<void> updateCartProduct(int id, int quantity) async {
    emit(UpdateCartLoadingState());
    final result = await cartRepo.updateCartProduct(id, quantity);
    result.fold(
      (failure) {
        if (!isClosed) emit(UpdateCartErrorState(failure.errMessage));
      },
      (cart) {
        cartProducts!.cartItems.where((item) => item.id == id).first.quantity =
            quantity;
        if (!isClosed) emit(UpdateCartSuccessState(cart));
      },
    );
  }

  void removeCartProductLocally(int productId) {
    toggleCartProduct(productId);
    allProductsCubit.cartProducts[productId] = false;
    cartProducts!.cartItems.removeWhere(
      (item) => item.product!.id == productId,
    );
  }
}
