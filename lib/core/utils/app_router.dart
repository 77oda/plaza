import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/utils/service_locator.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/auth/presentation/Login_Screen.dart';
import 'package:plaza/features/auth/presentation/register_screen.dart';
import 'package:plaza/features/layout/presentation/layout_screen.dart';
import 'package:plaza/features/onboarding/presentation/onboarding_screen.dart';

abstract class AppRouter {
  static const onBoardingScreen = '/OnBoardingScreen';
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';
  static const layoutScreen = '/LayoutScreen';

  static late String initialRoute;

  static Future<void> getInitialRoute() async {
    final finishedOnBoarding = await CacheHelper.getData('onBoarding') ?? false;
    final token = await CacheHelper.getSecuredString('token') ?? '';

    if (finishedOnBoarding == false)
      initialRoute = onBoardingScreen;
    else if (token == '')
      initialRoute = loginScreen;
    else
      initialRoute = layoutScreen;
  }

  static final router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),

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

      GoRoute(path: layoutScreen, builder: (context, state) => LayoutScreen()),
    ],
  );
}
