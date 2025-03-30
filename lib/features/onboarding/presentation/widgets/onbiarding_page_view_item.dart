import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/separator.dart';

Widget onBoardingPageViewItem(model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(child: Image(image: AssetImage('${model.image}'))),
    separator(0, 10),
    Text(
      '${model.title}',
      style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
    ),
    separator(0, 10),
    Text('${model.body}', style: TextStyle(fontSize: 20.sp)),
    separator(0, 50),
  ],
);
