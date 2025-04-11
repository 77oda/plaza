import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';

class ChangePassTextField extends StatefulWidget {
  const ChangePassTextField({
    super.key,
    required this.currentPass,
    required this.newPass,
  });
  final TextEditingController currentPass;
  final TextEditingController newPass;
  @override
  State<ChangePassTextField> createState() => _ChangePassTextFieldState();
}

class _ChangePassTextFieldState extends State<ChangePassTextField> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Current Password', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          controller: widget.currentPass,
          validate: (value) {
            if (value!.isEmpty) return 'This field can\'t be Empty';
          },
          isPassword: showPass,
          label: 'Please enter Current Password',
          suffix: showPass ? Icons.visibility_off : Icons.visibility,
          suffixPressed: () {
            setState(() {
              showPass = !showPass;
            });
          },
        ),
        SizedBox(height: 40.h),
        Text('New Password', style: TextStyle(fontSize: 15.sp)),
        customFormField(
          context: context,
          controller: widget.newPass,
          validate: (value) {
            if (value!.isEmpty) return 'This field can\'t be Empty';
          },
          isPassword: showPass,
          label: 'Please enter New Password',
          suffix: showPass ? Icons.visibility_off : Icons.visibility,
          suffixPressed: () {
            setState(() {
              showPass = !showPass;
            });
          },
        ),
      ],
    );
  }
}
