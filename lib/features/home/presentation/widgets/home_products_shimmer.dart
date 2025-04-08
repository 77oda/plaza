import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeProductsShimmer extends StatelessWidget {
  const HomeProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.74,
        children: List.generate(
          10,
          (index) => Container(
            color: Colors.white,
            padding: EdgeInsetsDirectional.only(
              start: 8.w,
              bottom: 8.h,
              end: 8.w,
            ),
            child: Shimmer(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey, Colors.white, Colors.grey],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 12.h,
                    width: 120.w,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 15.h),
                  Container(height: 12.h, width: 80.w, color: Colors.grey[300]),
                  SizedBox(height: 15.h),
                  Container(height: 12.h, width: 40.w, color: Colors.grey[300]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
