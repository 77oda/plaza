import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_buttom.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_item.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_total_price.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key, required this.model});
  final CartData model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:
                    (context, index) => CartItem(model: model.cartItems[index]),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: model.cartItems.length,
              ),
              CartTotalPrice(model: model),
              SizedBox(height: 50.h),
            ],
          ),
        ),
        CartButtom(),
      ],
    );
  }
}
