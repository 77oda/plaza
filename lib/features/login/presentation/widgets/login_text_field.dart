import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/custom_form_field.dart';

class LoginTextField extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customFormField(
          context: context,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          label: 'Email Address',
          prefix: Icons.email,
          validate: (value) {
            if (value!.isEmpty) return 'Email Address must be filled';
          },
        ),
        SizedBox(height: 40),
        customFormField(
          context: context,
          controller: passwordController,
          label: 'Password',
          prefix: Icons.lock,
          // isPassword: LoginCubit.get(context).showPassword,
          validate: (value) {
            if (value!.isEmpty) return 'Password must be filled';
          },
          onSubmit: (value) {
            // if (loginFormKey.currentState!.validate()) {
            //   LoginCubit.get(context).signIn(
            //     email: emailController.text,
            //     password: passwordController.text,
            //   );
            // }
          },
          // suffix: LoginCubit.get(context).suffixIcon,
          suffixPressed: () {
            // LoginCubit.get(context).changeSuffixIcon(context);
          },
        ),
      ],
    );
  }
}
