import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';

class SaveAddressBar extends StatelessWidget {
  const SaveAddressBar({super.key, this.model});

  final AddressData? model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'LOCATION INFORMATION',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        context.read<AddressCubit>().state is ButtomActionState
            ? TextButton(
              onPressed: () {
                context.read<AddressCubit>().emit(
                  SaveAddressSuccessState(model!),
                );
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: ColorsManager.gray),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}
