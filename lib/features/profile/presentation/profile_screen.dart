import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/profile/presentation/widget/profile_widget/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(titleSpacing: 0, title: Row(children: [AppLogo()])),
        body: ProfileBody(),
      ),
    );
  }
}
