import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';

class AccountReachOut extends StatelessWidget {
  const AccountReachOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Text(
            'REACH OUT TO US',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
        InkWell(
          onTap: () {
            // ShopCubit.get(context).getFAQsData();
            // navigateTo(context, FAQsScreen());
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, color: Colors.green),
                SizedBox(width: 15.w),
                Text(
                  'FAQs',
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
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.phone_in_talk_outlined, color: Colors.green),
                SizedBox(width: 15.w),
                Text(
                  'Contact Us',
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
