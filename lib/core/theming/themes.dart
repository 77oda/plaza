import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plaza/core/theming/colors.dart';

import '../utils/constants.dart';

ThemeData lightMode () => ThemeData(
  primaryColor: ColorsManager.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    actionsIconTheme: IconThemeData(
        color: Colors.black
    ),
    titleTextStyle: TextStyle(color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),),
  // primarySwatch: ColorsManager.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),),
    contentPadding: const EdgeInsetsDirectional.only(top: 5,start: 20),
    hintStyle: const TextStyle(color: Colors.black),
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: ColorsManager.primaryColor,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed
  ));




ThemeData darkMode () =>   ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor:Colors.grey[800],
    elevation: 0,
    actionsIconTheme: const IconThemeData(
        color: Colors.white
    ),
    titleTextStyle: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.grey[800],
      statusBarIconBrightness: Brightness.light,
    ),),
  primarySwatch: Colors.red,
  scaffoldBackgroundColor:Colors.grey[800],
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    contentPadding: const EdgeInsetsDirectional.only(top: 5,start: 30),
    hintStyle: const TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 15)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:Colors. grey[800],
    selectedItemColor: ColorsManager.primaryColor,
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  primaryIconTheme: const IconThemeData(color: Colors.black),

);