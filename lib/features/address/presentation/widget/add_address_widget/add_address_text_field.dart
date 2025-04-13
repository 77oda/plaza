import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';

class AddAddressTextField extends StatelessWidget {
  const AddAddressTextField({
    super.key,
    required this.cityControl,
    required this.regionControl,
    required this.detailsControl,
    required this.notesControl,
  });

  final TextEditingController cityControl;
  final TextEditingController regionControl;
  final TextEditingController detailsControl;
  final TextEditingController notesControl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('City', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          validate: (value) {
            if (value!.isEmpty) return 'This field cant be Empty';
          },
          controller: cityControl,
          label: 'Please enter your city name',
        ),
        SizedBox(height: 20.h),
        Text('Region', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          validate: (value) {
            if (value!.isEmpty) return 'This field cant be Empty';
          },
          controller: regionControl,
          label: 'Please enter your region',
        ),
        SizedBox(height: 20.h),
        Text('Details', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          validate: (value) {
            if (value!.isEmpty) return 'This field cant be Empty';
          },
          controller: detailsControl,
          label: 'Please enter some datails',
        ),
        SizedBox(height: 20.h),
        Text('Notes', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          validate: (value) {},
          controller: notesControl,
          label: 'Please add some notes to help find you',
        ),
      ],
    );
  }
}
