import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            // navigateTo(context, RegisterScreen());
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
