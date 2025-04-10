import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesNum extends StatelessWidget {
  const FavoritesNum({super.key, required this.total});
  final int total;

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
          Text('($total items)', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
