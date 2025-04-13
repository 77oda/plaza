import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/address/presentation/widget/add_address_widget/add_address_button.dart';
import 'package:plaza/features/address/presentation/widget/add_address_widget/add_address_text_field.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});

  final TextEditingController cityControl = TextEditingController();
  final TextEditingController regionControl = TextEditingController();
  final TextEditingController detailsControl = TextEditingController();
  final TextEditingController notesControl = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: addressFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOCATION INFORMATION',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.h),
              AddAddressTextField(
                cityControl: cityControl,
                regionControl: regionControl,
                detailsControl: detailsControl,
                notesControl: notesControl,
              ),
              SizedBox(height: 60.h),
              AddAddressButton(
                cityControl: cityControl,
                regionControl: regionControl,
                detailsControl: detailsControl,
                notesControl: notesControl,
                addressFormKey: addressFormKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
