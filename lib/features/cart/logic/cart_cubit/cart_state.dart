part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final CartModel cartModel;
  const CartSuccessState(this.cartModel);
}

class CartErrorState extends CartState {
  final String error;
  const CartErrorState(this.error);
}

class ToggleCartLoadingState extends CartState {}

class ToggleCartSuccessState extends CartState {
  final ToggleCartModel cartModel;
  const ToggleCartSuccessState(this.cartModel);
}

class ToggleCartErrorState extends CartState {
  final String error;
  const ToggleCartErrorState(this.error);
}

class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {
  final UpdateCartModel cartModel;
  const UpdateCartSuccessState(this.cartModel);
}

class UpdateCartErrorState extends CartState {
  final String error;
  const UpdateCartErrorState(this.error);
}
