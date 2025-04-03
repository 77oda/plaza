// ignore: file_names
import 'package:flutter/material.dart';
import 'package:plaza/features/auth/presentation/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginBody());
  }
}
