import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/core/widgets/custom_toast.dart';
import 'package:plaza/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:plaza/features/products/data/model/products_model.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({super.key, required this.model});
  final ProductData model;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen:
          (previous, current) =>
              current is ToggleCartSuccessState ||
              current is ToggleCartErrorState,
      listener: (context, state) {
        if (state is ToggleCartSuccessState) {
          showToast(state.cartModel.message);
        } else if (state is ToggleCartErrorState) {
          showToast(state.error);
        }
      },
      child: Container(
        width: double.infinity,
        height: 60.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
            ),
            backgroundColor: WidgetStateProperty.all(
              ColorsManager.primaryColor,
            ),
          ),
          onPressed: () async {
            if (context.read<AllProductsCubit>().cartProducts[model.id] ==
                true) {
              showToast(
                'Already in Your Cart \nCheck your cart To Edit or Delete ',
              );
            } else {
              await context.read<CartCubit>().toggleCartProduct(
                model.id as int,
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.white),
              SizedBox(width: 10.w),
              Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
