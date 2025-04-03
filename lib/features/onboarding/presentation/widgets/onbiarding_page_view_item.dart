import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget onBoardingPageViewItem(model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(child: Image(image: AssetImage('${model.image}'))),
    SizedBox(height: 10.h),
    Text(
      '${model.title}',
      style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10.h),
    Text('${model.body}', style: TextStyle(fontSize: 20.sp)),
    SizedBox(height: 50.h),
  ],
);
