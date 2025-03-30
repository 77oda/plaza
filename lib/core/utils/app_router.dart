import 'package:go_router/go_router.dart';
import 'package:plaza/features/login/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/login/presentation/Login_Screen.dart';
import 'package:plaza/features/onboarding/presentation/onboarding_screen.dart';

abstract class AppRouter {
  static const loginView = '/LoginScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnBoardingScreen()),

      GoRoute(path: loginView, builder: (context, state) => LoginScreen()),
    ],
  );
}
