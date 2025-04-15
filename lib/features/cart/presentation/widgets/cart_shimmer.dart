import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  Widget buildShimmerBox({
    double? width,
    double? height,
    BorderRadius? radius,
  }) {
    return Shimmer(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.grey, Colors.white, Colors.grey],
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius ?? BorderRadius.circular(2.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => myDivider(),
      itemBuilder:
          (context, index) => Container(
            height: 200.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  child: Row(
                    children: [
                      buildShimmerBox(width: 100.w, height: 100.h),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildShimmerBox(width: 200.w, height: 15.h),
                            SizedBox(height: 5.h),
                            buildShimmerBox(width: 180.w, height: 15.h),
                            const Spacer(),
                            buildShimmerBox(width: 80.w, height: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (_) => Row(
                        children: [
                          buildShimmerBox(width: 20.w, height: 20.h),
                          SizedBox(width: 5.w),
                        ],
                      ),
                    ),
                    const Spacer(),
                    buildShimmerBox(width: 60.w, height: 20.h),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
