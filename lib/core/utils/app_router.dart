import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/service_locator.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_cubit.dart';
import 'package:plaza/features/auth/presentation/Login_Screen.dart';
import 'package:plaza/features/auth/presentation/register_screen.dart';

import 'package:plaza/features/onboarding/presentation/onboarding_screen.dart';

abstract class AppRouter {
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnBoardingScreen()),

      GoRoute(
        path: loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ),
      ),

      GoRoute(
        path: registerScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
              child: RegisterScreen(),
            ),
      ),
    ],
  );
}
