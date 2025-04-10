import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/products/presentation/widgets/widget_products/products.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({required this.categoryName, super.key});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Text(
                categoryName,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Products(),
          ],
        ),
      ),
    );
  }
}
