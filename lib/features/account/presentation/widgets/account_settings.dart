import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
        myDivider(),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Row(
            children: [
              Icon(Icons.map_outlined, color: Colors.green),
              SizedBox(width: 15.w),
              Text(
                'Country',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Spacer(),
              Text('Egypt'),
              SizedBox(width: 10.w),
              Icon(Icons.arrow_forward_ios_rounded),
              SizedBox(width: 10.w),
            ],
          ),
        ),
        myDivider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.flag_outlined, color: Colors.green),
              SizedBox(width: 15.w),
              Text(
                'Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Spacer(),
              Text('English'),
              SizedBox(width: 10.w),
              Icon(Icons.arrow_forward_ios_rounded),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ],
    );
  }
}
