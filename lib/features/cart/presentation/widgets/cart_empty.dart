import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 70,
            color: Colors.greenAccent,
          ),
          SizedBox(height: 10.h),
          Text(
            'Your Cart is empty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Be Sure to fill your cart with something you like',
            style: TextStyle(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
