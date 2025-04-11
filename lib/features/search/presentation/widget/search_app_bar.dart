import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/theming/colors.dart';

AppBar searchAppBar(context, searchController, searchProducts) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 60.h,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      child: Row(
        children: [
          SizedBox(
            height: 35.h,
            width: 250.w,
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
              controller: searchController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'What are you looking for ?',
                hintStyle: TextStyle(fontSize: 15.sp),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsManager.primaryColor,
                ),
              ),
              onChanged: (value) {
                searchProducts(value);
              },
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text('cancel', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ),
  );
}
