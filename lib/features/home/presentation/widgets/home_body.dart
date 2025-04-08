import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/home/presentation/widgets/home_banners.dart';
import 'package:plaza/features/home/presentation/widgets/home_categories.dart';
import 'package:plaza/features/home/presentation/widgets/home_products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeBanners(),
            HomeCategories(),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: Text(
                'Hot Deals',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 2.h),
            HomeProducts(),
          ],
        ),
      ),
    );
  }
}
