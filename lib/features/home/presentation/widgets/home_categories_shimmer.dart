import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoriesShimmer extends StatelessWidget {
  const HomeCategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 140.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.separated(
        padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 36.r,
                  child: Shimmer(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.grey, Colors.white, Colors.grey],
                    ),
                    child: Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Shimmer(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.grey, Colors.white, Colors.grey],
                  ),
                  child: Container(
                    width: 70.w,
                    height: 15.h,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: 8,
      ),
    );
  }
}
