import 'package:flutter/material.dart';

class LoginForgetpassButton extends StatelessWidget {
  const LoginForgetpassButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forget Your Password ?',
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
