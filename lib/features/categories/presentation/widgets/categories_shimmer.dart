import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) => Shimmer(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.white, Colors.grey],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.grey[300],
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Container(height: 20, color: Colors.grey[300]),
                  ),
                  SizedBox(width: 15.w),
                  Container(width: 20, height: 20, color: Colors.grey[300]),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
      separatorBuilder:
          (context, index) => Container(
            color: Colors.grey[500],
            height: 1.h,
            width: double.infinity,
          ),
      itemCount: 10,
    );
  }
}
