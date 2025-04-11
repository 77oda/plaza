import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/profile/presentation/widget/change_pass_widget/change_pass_button.dart';
import 'package:plaza/features/profile/presentation/widget/change_pass_widget/change_pass_text_field.dart';

class ChangePassBody extends StatelessWidget {
  ChangePassBody({super.key});
  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  GlobalKey<FormState> changePasskey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Form(
        key: changePasskey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangePassTextField(currentPass: currentPass, newPass: newPass),
            SizedBox(height: 40.h),
            ChangePassButton(
              changePasskey: changePasskey,
              currentPass: currentPass,
              newPass: newPass,
            ),
          ],
        ),
      ),
    );
  }
}
