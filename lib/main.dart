import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/theming/themes.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/core/helpers/bloc_observer.dart';
import 'package:plaza/core/utils/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await AppRouter.getInitialRoute();
  Bloc.observer = MyBlocObserver();
  print('${await CacheHelper.getSecuredString('token')}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        title: 'Shop Mart',
        theme: lightMode(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
