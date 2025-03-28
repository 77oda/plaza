import 'package:flutter/material.dart';
import 'package:plaza/core/theming/themes.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
        title: 'plaza',
        theme: lightMode(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
