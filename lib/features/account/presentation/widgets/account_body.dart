import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/divider.dart';
import 'package:plaza/features/account/presentation/widgets/account_data.dart';
import 'package:plaza/features/account/presentation/widgets/account_reach_out.dart';
import 'package:plaza/features/account/presentation/widgets/account_settings.dart';
import 'package:plaza/features/account/presentation/widgets/account_sign_out.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountData(),
            myDivider(),
            AccountSettings(),
            AccountReachOut(),
            SizedBox(height: 15.h),
            AccountSignOut(),
          ],
        ),
      ),
    );
  }
}
