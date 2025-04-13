import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.cityControl,
    required this.regionControl,
    required this.detailsControl,
    required this.notesControl,
    required this.addressFormKey,
  });

  final TextEditingController cityControl;
  final TextEditingController regionControl;
  final TextEditingController detailsControl;
  final TextEditingController notesControl;
  final GlobalKey<FormState> addressFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is EditAddressLoadingState)
          return const Center(child: CircularProgressIndicator());
        else
          return SizedBox(
            height: 50.h,
            width: double.infinity,
            child: customButton(
              onTap: () {
                if (addressFormKey.currentState!.validate()) {
                  // if(isEdit)
                  //   {
                  context.read<AddressCubit>().addAddress(
                    cityControl.text,
                    regionControl.text,
                    detailsControl.text,
                    notesControl.text,
                  );
                  //     }
                  //   else {
                  //   ShopCubit.get(context).addAddress(
                  //       name: nameControl.text,
                  //       city: cityControl.text,
                  //       region: regionControl.text,
                  //       details: detailsControl.text,
                  //       notes: notesControl.text);
                  // }
                }
              },
              text: 'SAVE ADDRESS',
            ),
          );
      },
    );
  }
}
