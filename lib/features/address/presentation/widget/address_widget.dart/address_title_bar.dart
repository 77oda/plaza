import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/data/model/edit_address_model.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';

class AddressTitleBar extends StatelessWidget {
  const AddressTitleBar({super.key, required this.model});
  final AddressData model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.green),
          SizedBox(width: 5.w),
          Text(
            model.name as String,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              context.read<AddressCubit>().deleteAddress(model.id as int);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete_outline,
                  size: 17,
                  color: ColorsManager.primaryColor,
                ),
                Text(
                  'Delete',
                  style: TextStyle(color: ColorsManager.primaryColor),
                ),
              ],
            ),
          ),
          Container(height: 25.h, width: 2.w, color: Colors.grey[300]),
          TextButton(
            onPressed: () {
              context.read<AddressCubit>().emit(ButtomActionState(model));
            },
            child: Row(
              children: [
                Icon(Icons.edit, size: 17, color: Colors.grey),
                Text('Edit', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
