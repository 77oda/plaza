import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';

class LoginToRegister extends StatelessWidget {
  const LoginToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.registerScreen);
          },
          child: const Text(
            'Register Now',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
