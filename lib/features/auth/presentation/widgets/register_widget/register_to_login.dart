import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';

class RegisterToLogin extends StatelessWidget {
  const RegisterToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.loginScreen);
          },
          child: const Text('Sign In', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
