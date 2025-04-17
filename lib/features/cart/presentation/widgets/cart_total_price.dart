import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice({super.key, required this.model});
  final CartData model;

  num totalPrice() {
    num totalPrice = 0;
    for (int i = 0; i < model.cartItems.length; i++) {
      var priceProduct = model.cartItems[i].product!.price;
      var quantityProduct = model.cartItems[i].quantity;
      var total = priceProduct! * quantityProduct!;
      totalPrice = totalPrice + total;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Subtotal'
                '(${model.cartItems.length} Items)',
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                'EGP '
                '${totalPrice()}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: const [
              Text('Shipping Fee'),
              Spacer(),
              Text('Free', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                ' Inclusive of VAT',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Spacer(),
              Text(
                'EGP '
                '${totalPrice()}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
