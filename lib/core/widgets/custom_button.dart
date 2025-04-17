import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';

Widget customButton({
  required VoidCallback onTap,
  required String text,
  double? width = double.infinity,
}) => Container(
  height: 40.h,
  width: width,
  decoration: BoxDecoration(color: ColorsManager.primaryColor),
  child: ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(ColorsManager.primaryColor),
    ),
    onPressed: onTap,
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17.sp)),
  ),
);
