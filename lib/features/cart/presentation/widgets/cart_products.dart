import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/cart/data/model/cart_model.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_item.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key, required this.model});
  final CartData model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
          // Container(
          //   color: Colors.grey[200],
          //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             'Subtotal' '($cartLength Items)',
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //           Spacer(),
          //           Text(
          //             'EGP ' '${cartModel.data!.subTotal}',
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //         ],
          //       ),
          //       SizedBox(height: 15.h),
          //       Row(
          //         children: const [
          //           Text('Shipping Fee'),
          //           Spacer(),
          //           Text('Free', style: TextStyle(color: Colors.green)),
          //         ],
          //       ),
          //       SizedBox(height: 20.h),
          //       Row(
          //         textBaseline: TextBaseline.alphabetic,
          //         crossAxisAlignment: CrossAxisAlignment.baseline,
          //         children: [
          //           Text(
          //             'TOTAL',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             ' Inclusive of VAT',
          //             style: TextStyle(
          //               fontSize: 10.sp,
          //               color: Colors.grey,
          //               fontStyle: FontStyle.italic,
          //             ),
          //           ),
          //           Spacer(),
          //           Text(
          //             'EGP ' '${cartModel.data!.total}',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 60.h,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}
