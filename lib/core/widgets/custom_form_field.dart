import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';

Widget customFormField({
  required context,
  TextEditingController? controller,
  dynamic label,
  IconData? prefix,
  String? initialValue,
  TextInputType? keyboardType,
  onSubmit,
  onChange,
  onTap,
  required validate,
  bool isPassword = false,
  bool enabled = true,
  IconData? suffix,
  suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  obscureText: isPassword,
  textAlign: TextAlign.start,
  onFieldSubmitted: onSubmit,
  enabled: enabled,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  textCapitalization: TextCapitalization.words,
  // textAlignVertical: TextAlignVertical.center, jujjjjjjjjjjjjjjjjjj
  style: Theme.of(context).textTheme.bodyLarge,
  initialValue: initialValue,

  decoration: InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.primaryColor),
    ),
    hintText: label,
    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
    border: UnderlineInputBorder(),
    prefixIcon: prefix != null ? Icon(prefix) : null,
    suffixIcon:
        suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
  ),
);
