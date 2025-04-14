import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_button.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';

class SaveAddressButton extends StatelessWidget {
  const SaveAddressButton({
    super.key,
    required this.cityControl,
    required this.regionControl,
    required this.detailsControl,
    required this.notesControl,
    required this.addressFormKey,
    required this.isEdit,
    required this.model,
  });

  final TextEditingController cityControl;
  final TextEditingController regionControl;
  final TextEditingController detailsControl;
  final TextEditingController notesControl;
  final GlobalKey<FormState> addressFormKey;
  final bool isEdit;
  final AddressData? model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is SaveAddressLoadingState)
          return const Center(child: CircularProgressIndicator());
        else
          return SizedBox(
            height: 50.h,
            width: double.infinity,
            child: customButton(
              onTap: () {
                if (addressFormKey.currentState!.validate()) {
                  if (!isEdit) {
                    context.read<AddressCubit>().addAddress(
                      cityControl.text,
                      regionControl.text,
                      detailsControl.text,
                      notesControl.text,
                    );
                  } else {
                    context.read<AddressCubit>().editAddress(
                      model!.id as int,
                      cityControl.text,
                      regionControl.text,
                      detailsControl.text,
                      notesControl.text,
                    );
                  }
                }
              },
              text: 'SAVE ADDRESS',
            ),
          );
      },
    );
  }
}
