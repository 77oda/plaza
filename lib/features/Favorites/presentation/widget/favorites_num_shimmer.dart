import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesNumShimmer extends StatelessWidget {
  const FavoritesNumShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          Text(
            'My Wishlist',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(width: 5.w),
          Shimmer(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.white, Colors.grey],
            ),
            child: Container(width: 50.w, height: 20.h, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
