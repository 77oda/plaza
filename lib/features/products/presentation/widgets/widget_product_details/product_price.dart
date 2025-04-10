import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });
  final num price;
  final num oldPrice;
  final num discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EGP'
          '$price',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        if (discount != 0)
          Row(
            children: [
              Text(
                'EGP '
                '$oldPrice',
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                '$discount'
                '% OFF',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
      ],
    );
  }
}
