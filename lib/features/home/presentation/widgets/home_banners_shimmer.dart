import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeBannersShimmer extends StatelessWidget {
  const HomeBannersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Shimmer(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey, Colors.white, Colors.grey],
        ),
        child: Container(color: Colors.white),
      ),
    );
  }
}
