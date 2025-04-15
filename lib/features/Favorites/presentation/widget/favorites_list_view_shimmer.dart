import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesListViewShimmer extends StatelessWidget {
  const FavoritesListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => Shimmer(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.white, Colors.grey],
            ),
            child: Container(
              height: 200.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                    child: Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 120.h,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 15.h,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                width: double.infinity,
                                height: 15.h,
                                color: Colors.grey,
                              ),
                              Spacer(),
                              Container(
                                width: 100.w,
                                height: 20.h,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                width: 80.w,
                                height: 14.h,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(width: 80.w, height: 14.h, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
      separatorBuilder: (BuildContext context, int index) => myDivider(),
    );
  }
}
