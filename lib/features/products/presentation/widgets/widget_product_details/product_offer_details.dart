import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';

class ProductOfferDetails extends StatelessWidget {
  const ProductOfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Offer Details',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green),
            SizedBox(width: 5.w),
            Text('Enjoy free returns with this offer'),
          ],
        ),
        SizedBox(height: 15.h),
        myDivider(),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green),
            SizedBox(width: 5.w),
            Text('1 Year warranty'),
          ],
        ),
        SizedBox(height: 15.h),
        myDivider(),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green),
            SizedBox(width: 5.w),
            Text('Sold by ShopMart'),
          ],
        ),
      ],
    );
  }
}
