import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/utils/app_router.dart';
import 'package:plaza/core/widgets/app_logo.dart';

AppBar customAppBar(context) => AppBar(
  titleSpacing: 0,
  title: AppLogo(),
  actions: [
    IconButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.searchScreen);
      },
      icon: Icon(Icons.search),
    ),
  ],
);
