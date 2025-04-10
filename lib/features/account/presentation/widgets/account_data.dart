import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/widgets/divider.dart';

class AccountData extends StatelessWidget {
  const AccountData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Text(
            'MY ACCOUNT',
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.favoritesScreen);
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                Icon(Icons.favorite_border_rounded, color: Colors.green),
                SizedBox(width: 15.w),
                Text(
                  'WishList',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ),
        myDivider(),
        InkWell(
          onTap: () {
            // navigateTo(context, AddressesScreen());
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.green),
                SizedBox(width: 15.w),
                Text(
                  'Addresses',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ),
        myDivider(),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.profileScreen);
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                Icon(Icons.person_outline, color: Colors.green),
                SizedBox(width: 15.w),

                Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
