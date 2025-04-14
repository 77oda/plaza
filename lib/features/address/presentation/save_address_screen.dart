import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/theming/colors.dart';
import 'package:plaza/features/address/data/model/address_model.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';
import 'package:plaza/features/address/presentation/widget/save_address_widget/save_address_bar.dart';
import 'package:plaza/features/address/presentation/widget/save_address_widget/save_address_button.dart';
import 'package:plaza/features/address/presentation/widget/save_address_widget/save_address_text_field.dart';

class SaveAddressScreen extends StatelessWidget {
  SaveAddressScreen({super.key, required this.isEdit, this.model});

  final TextEditingController cityControl = TextEditingController();
  final TextEditingController regionControl = TextEditingController();
  final TextEditingController detailsControl = TextEditingController();
  final TextEditingController notesControl = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  final bool isEdit;
  final AddressData? model;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isEdit) {
          cityControl.text = model!.city!;
          regionControl.text = model!.region!;
          detailsControl.text = model!.details!;
          notesControl.text = model!.notes!;
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: addressFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SaveAddressBar(model: model),
                  SizedBox(height: 30.h),
                  SaveAddressTextField(
                    cityControl: cityControl,
                    regionControl: regionControl,
                    detailsControl: detailsControl,
                    notesControl: notesControl,
                  ),
                  SizedBox(height: 60.h),
                  SaveAddressButton(
                    cityControl: cityControl,
                    regionControl: regionControl,
                    detailsControl: detailsControl,
                    notesControl: notesControl,
                    addressFormKey: addressFormKey,
                    isEdit: isEdit,
                    model: model,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
