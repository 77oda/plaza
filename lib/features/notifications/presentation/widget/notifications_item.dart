import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/notifications/data/model/notifications_model.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({super.key, required this.model});
  final NotificationData model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.send),
              SizedBox(width: 7.w),
              Expanded(
                child: Text(
                  '${model.title}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
          Text('${model.message}', style: TextStyle(fontSize: 15.sp)),
        ],
      ),
    );
  }
}
