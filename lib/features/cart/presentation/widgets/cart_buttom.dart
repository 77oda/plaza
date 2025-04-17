import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_button.dart';

class CartButtom extends StatelessWidget {
  const CartButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: customButton(onTap: () {}, text: 'CheckOut'),
    );
  }
}
