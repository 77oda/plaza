import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSignOut extends StatelessWidget {
  const AccountSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 60.h,
      child: InkWell(
        onTap: () {
          // signOut(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.power_settings_new),
            SizedBox(width: 10.h),
            Text('SignOut', style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
