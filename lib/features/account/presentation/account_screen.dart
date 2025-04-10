import 'package:flutter/material.dart';
import 'package:plaza/features/account/presentation/widgets/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AccountBody()));
  }
}
