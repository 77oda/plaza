import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_empty.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_products.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_shimmer.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen:
          (previous, current) =>
              current is UpdateCartErrorState ||
              current is ToggleCartErrorState,
      listener:
          (context, state) => {
            if (state is UpdateCartErrorState) showToast(state.error),
            if (state is ToggleCartErrorState) showToast(state.error),
          },
      buildWhen:
          (previous, current) =>
              current is CartSuccessState ||
              current is CartLoadingState ||
              current is CartErrorState,
      builder: (context, state) {
        if (state is CartLoadingState)
          return CartShimmer();
        else if (state is CartErrorState)
          return Center(child: Text(state.error));
        else
          return context.watch<CartCubit>().cartProducts!.cartItems.isEmpty
              ? CartEmpty()
              : CartProducts(
                model: context.watch<CartCubit>().cartProducts as CartData,
              );
      },
    );
  }
}
