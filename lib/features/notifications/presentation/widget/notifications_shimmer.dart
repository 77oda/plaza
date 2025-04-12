import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsShimmer extends StatelessWidget {
  const NotificationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 10,
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Shimmer(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey, Colors.white, Colors.grey],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 100.w,
                        height: 15.h,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Container(
                    width: 250.w,
                    height: 15.h,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
