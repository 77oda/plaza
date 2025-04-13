import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/address/data/model/address_model.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key, required this.model});
  final AddressData model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAddressInfo('City:', '${model.city}'),
          SizedBox(height: 10.h),
          buildAddressInfo('Region:', '${model.region}'),
          SizedBox(height: 10.h),
          buildAddressInfo('Details:', '${model.details}'),
          SizedBox(height: 10.h),
          buildAddressInfo('Notes:', '${model.notes}'),
        ],
      ),
    );
  }
}

Widget buildAddressInfo(String title, String value) {
  return Row(
    children: [
      Text(title, style: TextStyle(fontSize: 18.sp, color: Colors.grey)),
      SizedBox(width: 5.w),
      Expanded(
        child: Text(
          value == 'null' ? '' : value,
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
    ],
  );
}
