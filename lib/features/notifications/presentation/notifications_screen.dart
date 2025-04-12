import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/notifications/presentation/widget/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: AppLogo()),
      body: NotificationsBody(),
    );
  }
}
