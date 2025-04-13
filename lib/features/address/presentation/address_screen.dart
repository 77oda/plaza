import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/app_logo.dart';
import 'package:plaza/features/address/presentation/widget/address_widget.dart/address_body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: AppLogo()),
      body: AddressBody(),
    );
  }
}
