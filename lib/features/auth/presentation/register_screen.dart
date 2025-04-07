import 'package:flutter/material.dart';
import 'package:plaza/features/auth/presentation/widgets/register_widget/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterBody());
  }
}
