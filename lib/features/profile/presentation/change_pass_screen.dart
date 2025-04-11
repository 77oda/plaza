import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/profile/presentation/widget/change_pass_widget/change_pass_body.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: AppLogo()),
      body: ChangePassBody(),
    );
  }
}
