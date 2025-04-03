import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_state.dart';
import 'package:plaza/features/auth/presentation/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterBody());
  }
}
